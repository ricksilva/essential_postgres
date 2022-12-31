drop table if exists us_president;

create table us_president (
    president_id    int,
    president_name  text,
    president_party text
);

drop table if exists product;

create table product
(
    product_id      int, -- int is short for integer
    product_name    text,
    supplier_id     int
);

insert into product (product_id, product_name, supplier_id) values (11, 'Banjo', 100);

-- Surrounding Banjo with single quotes works nicely
select  *
from    product
where   product_name = 'Banjo';

-- Surrounding Banjo with double quotes produces an error. Don't do this.
select  *
from    product
where   product_name = "Banjo";

drop table if exists special_number;

create table special_number
(
    name            text,
    special_value   numeric -- You could use "numeric" or "decimal". They are the same.
);

insert into special_number(name, special_value) values ('Pi', 3.14159);
insert into special_number(name, special_value) values ('Golden Ratio', 1.61803);
insert into special_number(name, special_value) values ('Euros to Dollars', 1.17);
insert into special_number(name, special_value) values ('US National Debt', 28523782444392.17);

select * from special_number;

-- Let's drop and recreate the special number table and define the special_value column as numeric(10,4)
drop table if exists special_number;

create table special_number
(
    name            text,
    special_value   numeric(10,4)
);

insert into special_number(name, special_value) values ('Pi', 3.14159);
insert into special_number(name, special_value) values ('Golden Ratio', 1.61803);
insert into special_number(name, special_value) values ('Euros to Dollars', 1.17);

-- This insert statement fails because 28523782444392.17 won't fit in a column defined as numeric(10,4)
insert into special_number(name, special_value) values ('US National Debt', 28523782444392.17);

-- This query returns only 3 rows
select * from special_number;

drop table if exists clock_change;

create table clock_change
(
    clock_change_date   date
);

insert into clock_change(clock_change_date) values ('2020-11-01');
insert into clock_change(clock_change_date) values ('2021-03-14');
insert into clock_change(clock_change_date) values ('2021-11-07');
insert into clock_change(clock_change_date) values ('2022-03-13');
insert into clock_change(clock_change_date) values ('2022-11-06');

select  *
from    clock_change
where   clock_change_date = '2021-11-07';

select current_date;

-- Return a row if today is a day that we change the clocks
select  *
from    clock_change
where   clock_change_date = current_date;

-- Return any clock change dates in the last 10 days
select  *
from    clock_change
where   clock_change_date > current_date - 10;

-- Below we are dropping and recreating the start_time table with its one column that has the data type:
--      time without time zone
--      time with time zone
--      timestamp without time zone
--      timestamp with time zone

drop table if exists start_time;

-- You can use "time without time zone" or just "time"
create table start_time
(
    twotz   time without time zone
);

insert into start_time(twotz) values ('15:55:25.832142');

select  twotz
from    start_time;

drop table if exists start_time;

-- You can use "time with time zone" or just "timetz"
create table start_time
(
    twtz    time with time zone
);

insert into start_time(twtz) values (current_time);

-- This will return no rows because the current time has changed
select  *
from    start_time
where   twtz = current_time;

-- Return any rows in the table with times that are within the last hour
select  *
from    start_time
where   twtz > (current_time - interval '1 hour');

drop table if exists start_time;

-- You can use "timestamp without time zone" or just "timestamp"
create table start_time
(
    tswotz  timestamp without time zone
);

drop table if exists start_time;

-- You can use "timestamp with time zone" or just "timestamp"
create table start_time
(
    tswtz   timestamp with time zone
);

-- now() and current_timestamp are the same thing
-- These two queries will return no rows because there aren't any rows in the table for the current timestamp.
select  *
from    start_time
where   tswtz = now();

select  *
from    start_time
where   tswtz = current_timestamp;

-- Boolean
drop table if exists presidential_hair;

create table presidential_hair
(
    president_name  text,
    good_hair       bool
);

insert into presidential_hair
    (
    president_name,
    good_hair
    )
values
    (
    'Richard Nixon',
    false
    );

insert into presidential_hair
    (
    president_name,
    good_hair
    )
values
    (
    'Martin Van Buren', -- What were you thinking, Marty?
    false
    );

insert into presidential_hair
    (
    president_name,
    good_hair
    )
values
    (
    'John F. Kennedy',
    true
    );

select  *
from    presidential_hair;

-- There are lots of ways to check the good_hair boolean for true
select  president_name
from    presidential_hair
where   good_hair;

select  president_name
from    presidential_hair
where   good_hair is true;

select  president_name
from    presidential_hair
where   good_hair = true;

select  president_name
from    presidential_hair
where   good_hair = 't';

-- There are lots of ways to check the good_hair boolean for false
select  president_name
from    presidential_hair
where   not good_hair;

select  president_name
from    presidential_hair
where   good_hair is false;

select  president_name
from    presidential_hair
where   good_hair = false;

select  president_name
from    presidential_hair
where   good_hair = 'f';

drop table if exists application_user;

create table application_user
(
    user_name           text,
    active_user_flag    bool,
    speaks_english_flag bool,
    speaks_spanish_flag bool
);

insert into application_user (user_name, active_user_flag, speaks_english_flag, speaks_spanish_flag)
values ('Rick Silva', true, true, false);

insert into application_user (user_name, active_user_flag, speaks_english_flag, speaks_spanish_flag)
values ('Kendra Duncan', true, true, true);

insert into application_user (user_name, active_user_flag, speaks_english_flag, speaks_spanish_flag)
values ('Jose Gonzalez', false, false, true);

-- Querying active users who speak spanish
select  *
from    application_user
where   active_user_flag
and     speaks_spanish_flag;

drop table if exists us_state;

create table us_state
(
    state_code      char(2),
    state_name      text
);

insert into us_state(state_code, state_name) values ('MA', 'Massachusetts');
insert into us_state(state_code, state_name) values ('NC', 'North Carolina');
insert into us_state(state_code, state_name) values ('HI', 'Hawaii');

select * from us_state;

drop table if exists us_president;

-- Making the president_id column the primary key for this table
create table us_president
(
    president_id    int     primary key,
    president_name  text,
    president_party text
);

drop table if exists high_temperature;

-- Making the city and temp_date columns the primary key for this table
create table high_temperature
(
    city        text,
    temp_date   date,
    high_temp   int,
    primary key (city, temp_date)
);

insert into high_temperature(city, temp_date, high_temp) values ('Boston',  '2021-12-01', 36);
insert into high_temperature(city, temp_date, high_temp) values ('Boston',  '2021-12-02', 31);
insert into high_temperature(city, temp_date, high_temp) values ('Boston',  '2021-12-03', 27);
insert into high_temperature(city, temp_date, high_temp) values ('Raleigh', '2021-12-01', 54);
insert into high_temperature(city, temp_date, high_temp) values ('Raleigh', '2021-12-02', 56);
insert into high_temperature(city, temp_date, high_temp) values ('Raleigh', '2021-12-03', 49);

select * from high_temperature;

drop table if exists supplier;

create table supplier
(
    supplier_id     int     primary key,
    supplier_name   text
);

drop table if exists product;

-- The product table's foreign key is the supplier_id column.
-- It references the primary key of the supplier table.
create table product
(
    product_id      int,
    product_name    text,
    supplier_id     int,
    foreign key (supplier_id) references supplier (supplier_id)
);

drop table if exists us_president;

-- Disallowing nulls for the president_name column
create table us_president
(
    president_id    int     primary key,
    president_name  text    not null,
    president_party text
);

drop table if exists customer;

-- Setting email_address to "unique" prevents two rows from having the same email_address.
create table customer
(
    customer_id     int     primary key,
    customer_name   text    not null,
    email_address   text    unique
);

drop table if exists high_temperature;

-- "check" contraints
create table high_temperature
(
    city        text,
    temp_date   date    check (temp_date between '2020-01-01' and '2030-01-01'),
    high_temp   int     check (high_temp < 150)
);

-- Creating an index on the existing product table
create index product_supplier_index on product(supplier_id);

drop table if exists customer;

create table customer
(
    customer_id     int     primary key,
    customer_name   text    not null,
    city            text,
    zip             text
);

-- Altering a table
alter table customer add column county text;
alter table customer drop column zip;
alter table customer rename column city to city_or_town;

-- Look at the columns now
select * from customer;

-- Inserting a row into a table
insert into us_president(president_id, president_name, president_party)
values (33, 'Harry Truman', 'Democrat');

delete from us_president;

-- This is wrong. We can't insert 3 values into 2 columns.
insert into us_president(president_id, president_name)
values (33, 'Harry Truman', 'Democrat');

-- Even though this works, don't do this. List the column names.
insert into us_president
values (33, 'Harry Truman', 'Democrat');

-- Drop and recreate the us_president table
drop table if exists us_president;

create table us_president (
    president_id    int,
    president_name  text,
    president_party text
);

insert into us_president(president_id, president_name, president_party) values (1, 'George Washington', null);
insert into us_president(president_id, president_name, president_party) values (2, 'John Adams', 'Federalist');
insert into us_president(president_id, president_name, president_party) values (3, 'Thomas Jefferson', 'Democratic-Republican');
insert into us_president(president_id, president_name, president_party) values (4, 'James Madison', 'Democratic-Republican');
insert into us_president(president_id, president_name, president_party) values (5, 'James Monroe', 'Democratic-Republican');
insert into us_president(president_id, president_name, president_party) values (6, 'John Quincy Adams', 'Democratic-Republican');
insert into us_president(president_id, president_name, president_party) values (7, 'Andrew Jackson', 'Democrat');
insert into us_president(president_id, president_name, president_party) values (8, 'Martin Van Buren', 'Democrat');
insert into us_president(president_id, president_name, president_party) values (9, 'William Harrison', 'Whig');
insert into us_president(president_id, president_name, president_party) values (10, 'John Tyler', 'Whig');
insert into us_president(president_id, president_name, president_party) values (11, 'James Polk' , 'Democrat');
insert into us_president(president_id, president_name, president_party) values (12, 'Zachary Taylor', 'Whig');
insert into us_president(president_id, president_name, president_party) values (13, 'Millard Fillmore', 'Whig');
insert into us_president(president_id, president_name, president_party) values (14, 'Franklin Pierce' , 'Democrat');
insert into us_president(president_id, president_name, president_party) values (15, 'James Buchanan', 'Democrat');
insert into us_president(president_id, president_name, president_party) values (16, 'Abraham Lincoln', 'Republican');
insert into us_president(president_id, president_name, president_party) values (17, 'Andrew Johnson', 'Democrat');
insert into us_president(president_id, president_name, president_party) values (18, 'Ulysses Grant', 'Republican');
insert into us_president(president_id, president_name, president_party) values (19, 'Rutherford Hayes', 'Republican');
insert into us_president(president_id, president_name, president_party) values (20, 'James Abram Garfield', 'Republican');
insert into us_president(president_id, president_name, president_party) values (21, 'Chester Arthur', 'Republican');
insert into us_president(president_id, president_name, president_party) values (22, 'Grover Cleveland', 'Democrat');
insert into us_president(president_id, president_name, president_party) values (23, 'Benjamin Harrison', 'Republican');
insert into us_president(president_id, president_name, president_party) values (24, 'Grover Cleveland', 'Democrat');
insert into us_president(president_id, president_name, president_party) values (25, 'William McKinley', 'Republican');
insert into us_president(president_id, president_name, president_party) values (26, 'Theodore Roosevelt', 'Republican');
insert into us_president(president_id, president_name, president_party) values (27, 'William Taft', 'Republican');
insert into us_president(president_id, president_name, president_party) values (28, 'Woodrow Wilson', 'Democrat');
insert into us_president(president_id, president_name, president_party) values (29, 'Warren Harding', 'Republican');
insert into us_president(president_id, president_name, president_party) values (30, 'Calvin Coolidge', 'Republican');
insert into us_president(president_id, president_name, president_party) values (31, 'Herbert Hoover', 'Republican');
insert into us_president(president_id, president_name, president_party) values (32, 'Franklin Roosevelt', 'Democrat');
insert into us_president(president_id, president_name, president_party) values (33, 'Harry Truman', 'Democrat');
insert into us_president(president_id, president_name, president_party) values (34, 'Dwight Eisenhower', 'Republican');
insert into us_president(president_id, president_name, president_party) values (35, 'John Kennedy', 'Democrat');
insert into us_president(president_id, president_name, president_party) values (36, 'Lyndon Johnson', 'Democrat');
insert into us_president(president_id, president_name, president_party) values (37, 'Richard Nixon', 'Republican');
insert into us_president(president_id, president_name, president_party) values (38, 'Gerald Ford', 'Republican');
insert into us_president(president_id, president_name, president_party) values (39, 'Jimmy Carter', 'Democrat');
insert into us_president(president_id, president_name, president_party) values (40, 'Ronald Reagan', 'Republican');
insert into us_president(president_id, president_name, president_party) values (41, 'George Herbert Walker Bush', 'Republican');
insert into us_president(president_id, president_name, president_party) values (42, 'Bill Clinton', 'Democrat');
insert into us_president(president_id, president_name, president_party) values (43, 'George W. Bush', 'Republican');
insert into us_president(president_id, president_name, president_party) values (44, 'Barack Obama', 'Democrat');
insert into us_president(president_id, president_name, president_party) values (45, 'Donald Trump', 'Republican');
insert into us_president(president_id, president_name, president_party) values (46, 'Joe Biden', 'Democrat');

drop table if exists us_republican_president;

create table us_republican_president (
    president_id    int,
    president_name  text
);

-- Inserting data from another table
insert into us_republican_president
    (
        president_id,
        president_name
    )
select  president_id,
        president_name
from    us_president
where   president_party = 'Republican';

select * from us_republican_president;

-- Updating data
update  us_president
set     president_party = 'None'
where   president_party is null;

update  us_president
set     president_name = 'Lyndon Baines Johnson'
where   president_name = 'Lyndon Johnson';

select  *
from    us_president
where   president_id = 36;

-- Updating without a "where" clause updates ALL president names to Lyndon Baines Johnson!
-- This is probably not what we meant to do.
update  us_president
set     president_name = 'Lyndon Baines Johnson';

select * from us_president;

-- Deleting all rows in the supplier table
delete from supplier;

-- Deleting all Republicans from the us_president table
delete from us_president
where president_party = 'Republican';

drop table product;

-- Removing all rows from the supplier table quickly
truncate supplier;

insert into supplier(supplier_id, supplier_name) values (500, 'Max the Mandolin Maker');

-- Deleting the row for supplier 500 from the supplier table
delete from supplier
where supplier_id = 500;
