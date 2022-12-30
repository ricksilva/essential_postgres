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

insert into product (product_id, product_name, supplier_id)
values (11, 'Banjo', 100);

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
-- These two queries will return no rows because there aren't any rows in the tables for the current timestamp.
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

select  president_name
from    presidential_hair
where   not good_hair;

-- More to come