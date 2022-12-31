drop table if exists customer;

create table customer
(
    customer_id     int,
    first_name      text,
    last_name       text,
    city            text,
    state           text,
    zip             text
);

insert into customer (customer_id, first_name, last_name, city, state, zip)
values (1, 'Joe', 'Smith', 'San Jose', 'CA', '12121');

insert into customer (customer_id, first_name, last_name, city, state, zip)
values (2, 'Sum', 'Guy', 'Omaha', 'NE', '49494');

insert into customer (customer_id, first_name, last_name, city, state, zip)
values (3, 'Mary', 'Jones', 'Merrimack', 'NH', 78787);

alter table customer add column middle_name text;

select * from customer;

-- Selecting all columns in the order you want
select  customer_id,
        first_name,
        middle_name,
        last_name
from    customer;

-- Make a copy customer table copy that includes all data
create table customer_temp as
select * from customer;

-- Drop the original customer table
drop table customer;

-- Recreate a new customer table with the new column order
create table customer
(
    customer_id     int,
    first_name      text,
    middle_name     text, -- Put middle_name here
    last_name       text,
    city            text,
    state           text,
    zip             text
);

-- Put the saved data into the new customer table
insert into customer
(
        customer_id,
        first_name,
        middle_name,
        last_name,
        city,
        state,
        zip
)
select  customer_id,
        first_name,
        middle_name,
        last_name,
        city,
        state,
        zip
from    customer_temp;

-- Remove the copied data table
drop table customer_temp;

-- Now the middle name is in the table between first and last name
select * from customer;

-- Create the f_dem_to_rep_ratio() function
create or replace function f_dem_to_rep_ratio() returns numeric
as $$
declare
    v_num_democrats     numeric;
    v_num_republicans   numeric;
    v_dem_to_rep_ratio  numeric;
begin
    select  count(*)
    into    v_num_democrats
    from    us_president
    where   president_party = 'Democrat';

    -- Adding a "raise notice" statement for debugging
    raise notice 'The count of Democrats is %', v_num_democrats;

    select  count(*)
    into    v_num_republicans
    from    us_president
    where   president_party = 'Republicans'; -- THIS SHOULD BE 'Republican' WITH OUT THE S

    -- Adding a "raise notice" statement for debugging
    raise notice 'The count of Republicans is %', v_num_republicans;

    v_dem_to_rep_ratio = v_num_democrats / (v_num_republicans + v_num_democrats);

    -- Adding a "raise notice" statement for debugging
    raise notice 'The ratio is %', v_dem_to_rep_ratio;

    return v_dem_to_rep_ratio;
end;
$$ language plpgsql;

-- Call the function
select f_dem_to_rep_ratio();

drop table if exists start_time;

create table start_time
(
    twotz   time without time zone
);

-- "allballs" is all zeroes
insert into start_time (twotz) select 'allballs';

select * from start_time;

select now();

-- This returns an error message because substr() expects the first argument it gets sent to be a string
-- and we sent it the results of the now() function, which is a datetime.
select substr(now(), 1, 7);

-- It works if we cast the results of now() to text
select substr(now()::text, 1, 7);

-- This syntax does the same thing
select substr(cast(now() as text), 1, 7);

-- Casting a string '123' to an integer
select cast('123' as int);

-- Converting a string to a date
select to_date('28 Oct 2021', 'DD Mon YYYY');

select  to_timestamp(
            '28 Oct 2021 09:36:47 am',
            'DD Mon YYYY HH:MI:SS AM'
);

select  to_char(clock_change_date, 'Mon DD, YYYY')
from    clock_change;

select  to_char(123, '99999'),
        to_char(123, '00000'),
        to_char(1234.56, 'PL9G999.99');

-- Casting 2021 to a roman numeral. Lol.
select to_char(2021, 'RN');

select  to_number(
            '$1,234.56',
            'L9G999.99'
);

drop table if exists loan_info;

create table loan_info
(
    property_tax    int,
    insurance       int,
    rate            decimal(6,2)
);

insert into loan_info (property_tax, insurance, rate) values (50, 40, 3.25);

select * from loan_info;

select  property_tax + insurance * 12 / rate
from    loan_info;

select  ((property_tax + insurance) * 12) / rate
from    loan_info;

-- On a Mac, use the /tmp directory for creating or loading files. On a PC, use the C:\Users\Public\ directory
-- or use your own directories if you have permissions.
copy us_president to '/tmp/us_president.txt'; -- Mac
copy us_president to 'C:\Users\Public\us_president.txt'; -- Windows

-- Create a csv file
copy us_president to '/tmp/us_president.csv' with csv; -- Mac
copy us_president to 'C:\Users\Public\us_president.csv' with csv -- Windows

-- Create a pipe-delimited file (with|pipes|between|the|fields)
copy us_president to '/tmp/us_president_pipe.txt' with delimiter '|'; -- Mac
copy us_president to 'C:\Users\Public\us_president_pipe.txt' with delimiter '|'; -- Windows

drop table if exists us_president_staging;

create table us_president_staging as
select  *
from    us_president
where   1 = 2;

copy us_president_staging from '/tmp/us_president.txt'; -- Mac
copy us_president_staging from 'C:\Users\Public\us_president.txt'; -- Windows

select * from us_president_staging;

drop table if exists donation_detail_staging;

create table donation_detail_staging
(
    donor           text,
    donation_amount int
);

insert into donation_detail_staging(donor, donation_amount) values ('Jacki Smith', 200);
insert into donation_detail_staging(donor, donation_amount) values ('Jacki Smith', 850);
insert into donation_detail_staging(donor, donation_amount) values ('RJ Boyle', 100);
insert into donation_detail_staging(donor, donation_amount) values ('Jacki Smith', 100);

drop table if exists donation_summary;

create table donation_summary as
select  donor,
        sum(donation_amount) as donation_sum
from    donation_detail_staging
group by donor;

select * from donation_summary;

alter table donation_summary add primary key (donor);

-- Common Table Expressions (CTEs)
with party_cte as
(
select  president_party,
        count(*) as president_count
from    us_president
group by president_party
)
select  avg(president_count)
from    party_cte;

-- The SQL that made up the CTE in isolation
select  president_party,
        count(*) as president_count
from    us_president
group by president_party;
