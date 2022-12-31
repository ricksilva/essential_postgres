-- The absolute value of 8 and -8 is 8.
select  abs(8),
        abs(-8);

drop table if exists weather_forecast_vs_actual;

create table weather_forecast_vs_actual
(
    meteorologist   text,
    forecasted_high int,
    actual_high     int
);

insert into weather_forecast_vs_actual (meteorologist, forecasted_high, actual_high)
values ('Gail Winds', 74, 80);

insert into weather_forecast_vs_actual (meteorologist, forecasted_high, actual_high)
values ('Sunny Cloudfoot', 77, 86);

insert into weather_forecast_vs_actual (meteorologist, forecasted_high, actual_high)
values ('Storm Warning', 59, 38);

select  meteorologist,
        abs(forecasted_high – actual_high) degrees_off
from    weather_forecast_vs_actual;

select  *
from    weather_forecast_vs_actual
where   abs(forecasted_high - actual_high) < 10;

select upper('MiXed');

drop table if exists city;

create table city
(
    city    text,
    state   text
);

insert into city(city, state) values ('Boston', 'Massachusetts');
insert into city(city, state) values ('Raleigh', 'North Carolina');
insert into city(city, state) values ('Sacremento', 'California');

select * from city;

drop table if exists yearly_precipitation;

create table yearly_precipitation
(
    city_name       text,
    precipitation   decimal(6,1)
);

insert into yearly_precipitation (city_name, precipitation) values ('BOSTON', 47.1);
insert into yearly_precipitation (city_name, precipitation) values ('RALEIGH', 50.9);
insert into yearly_precipitation (city_name, precipitation) values ('SACREMENTO', 21.4);

select * from yearly_precipitation;

-- This query returns no results because the city names don't match (Boston vs BOSTON)
select  a.city,
        a.state,
        b.precipitation
from    city a
join    yearly_precipitation b
on      a.city = b.city_name;

-- Comparing based on uppercase city names worked. (BOSTON vs BOSTON)
select  a.city,
        a.state,
        b.precipitation
from    city a
join    yearly_precipitation b
on      upper(a.city) = upper(b.city_name);

select lower('MiXed');

-- Comparing based on lowercase city names works too. (boston vs boston)
select  a.city,
        a.state,
        b.precipitation
from    city a
join    yearly_precipitation b
on      lower(a.city) = lower(b.city_name);

select initcap('george HERBERT wAlKeR BuSh');

select initcap('e e cummings');

select round(3.1415);

select round(3.5141);

select trunc(3.1415);

select trunc(3.5141);

select trunc(3.5141, 2);

select ceil(3.1415);

select ceil(-3.1415);

select floor(3.1415);

select floor(-3.1415);

select length('A long string');

select  city,
        length(city)
from    city;

select  max(length(city))
from    city;

select  min(length(city))
from    city;

drop table if exists barcode;

create table barcode
(
    code    text
);

insert into barcode(code) values ('811399100131');
insert into barcode(code) values ('096244031005');
insert into barcode(code) values ('789661001783');

select * from barcode;

select  substr(code, 2, 5) mfg_code
from    barcode;

select  code,
        substr(code, 9)
from    barcode;

drop table if exists raw_data_load;

create table raw_data_load
(
    col1    text,
    col2    text,
    col3    text
);

insert into raw_data_load(col1, col2, col3) values (' Apple ', ' Penny ', ' String ');

select  trim(col1),
        trim(col2),
        trim(col3)
from    raw_data_load;

select trim('kayak', 'k');

select ltrim (' Penny ');

select ltrim('0000738', '0');

select rtrim('Boston Massachusetts', 'Massachusetts');

select upper(
        rtrim('Boston Massachusetts', 'Massachusetts')
);

drop table if exists customer;

create table customer
(
    first_name  text,
    last_name   text
);

insert into customer(first_name, last_name) values ('Joe', 'Smith');
insert into customer(first_name, last_name) values ('Some', 'Guy');
insert into customer(first_name, last_name) values ('Basketball', 'Jones');

select  last_name,
        left(last_name, 3)
from    customer;


select  last_name,
        left(last_name, -1)
from    customer;

select  last_name,
        right(last_name, 3)
from    customer;

select  last_name,
        right(last_name, -2)
from    customer;

drop table if exists send_check;

create table send_check
(
    amt     text
);

insert into send_check(amt) values ('123');
insert into send_check(amt) values ('854');
insert into send_check(amt) values ('24');

select  lpad(amt, 5, '*')
from    send_check;

drop table if exists runway;

create table runway
(
    runway_name text
);

insert into runway(runway_name) values ('Runway 172 – Orange County Airport');
insert into runway(runway_name) values ('Runway 213 – Orange County Airport');
insert into runway(runway_name) values ('Runway 985 – Washington National Airport');

select  replace(
            runway_name,
            'Orange County Airport',
            'John Wayne Airport'
            )
from    runway;

update  runway
set     runway_name = replace(
                        runway_name,
                        'Orange County Airport',
                        'John Wayne Airport'
                        )
;

select * from runway;

select  format(
            'President %s was a %s',
            president_name,
            president_party
        )
from    us_president
where   president_id between 31 and 34;

select now();

select extract(century from now());

select extract(day from now());

select extract(month from now());

select exp(1);

select pi();

select power(3, 2);

select random();

select position('pal' in 'principal');

select position('i' in 'team');

select strpos('principal', 'pal');

select version();
