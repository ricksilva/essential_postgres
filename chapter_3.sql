drop view if exists v_democrat_president;

create view v_democrat_president as
    select  president_id,
            president_name
    from    us_president
    where   president_party = 'Democrat';

select * from v_democrat_president;

select  *
from    v_democrat_president
where   president_id = 7;

-- Change president 7 (Andrew Jackson) from a Democrat to a Republican
update  us_president -- This is the table that the view is based on
set     president_party = 'Republican'
where   president_id = 7;

-- Now this query returns no rows
select  *
from    v_democrat_president
where   president_id = 7;

drop table if exists employee;

create table employee
    (
    employee_id     int,
    employee_name   text,
    title           text,
    salary          decimal(12,2)
);

insert into employee(employee_id, employee_name, title_salary)
values (1, 'Dave Nelson', 'CEO', 980000);

insert into employee(employee_id, employee_name, title_salary)
values (2, 'Rob Field', 'Sales Manager', 349000);

insert into employee(employee_id, employee_name, title_salary)
values (3, 'Cindy Rhodes', 'Software Developer', 574000);

select * from employee;

drop view if exists v_employee;

create view v_employee as
    select  employee_id,
            employee_name,
            title
    from    employee;

select * from v_employee;

drop materialized view if exists mv_democrat_president;

create materialized view mv_democrat_president as
    select  president_id,
            president_name
    from    us_president
    where   president_party = 'Democrat';

select  *
from    mv_democrat_president
where   president_id = 7;

update  us_president -- The table that the materialized view is based on
set     president_party = 'Republican'
where   president_id = 7;

-- The change is not reflected in the materialized view
select  *
from    mv_democrat_president
where   president_id = 7;

refresh materialized view mv_democrat_president;

-- Now the change is reflected in the materialized view
select  *
from    mv_democrat_president
where   president_id = 7;

-- Create a sequence called president_sequence and use it to increment the
-- value of the president_id column in the us_president table.
create sequence president_sequence;

delete from us_president;

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'George Washington', null);

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'John Adams', 'Federalist');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Thomas Jefferson', 'Democratic-Republican');

select * from us_president;

select upper('Say it loud');

-- Writing a function called f_get_president_and_party()
create or replace function f_get_president_and_party(int) returns text as $$
    select  president_name || ' (' || president_party || ')'
    from    us_president
    where   president_id = $1;
$$ language sql;

-- Calling the function for president 7
select f_get_president_and_party(7);

-- Calling the function from within a more involved query
select  f_get_president_and_party(president_id)
from    us_president
where   president_id > 40;

-- Creating the f_get_president_note_current() function
create or replace function f_get_president_note_current(p_president_id int)
returns text as $$
declare
    v_max_president_id int;
    v_president_name text;
    v_president_party text;
    v_current_text text = ";
begin
    select  max(president_id)
    into    v_max_president_id
    from    us_president;

    if (v_max_president_id = p_president_id) then
        v_current_text = '**Current President**';
    end if;

    select  president_name,
            president_party
    into    v_president_name,
            v_president_party
    from    us_president
    where   president_id = p_president_id;

    return  'President ID: ' || p_president_id || ' Name: ' || v_president_name ||
            ' Political Party: ' || v_president_party || ' ' || v_current_text;

end;
$$ language plpgsql;

-- Calling the function for president 33
select f_get_president_note_current(33);

-- Calling the function for president 46
select f_get_president_note_current(46);

drop table if exists some_table;

create table some_table
(
    president_id    int
);

-- Creating a function with $$
create or replace function f_no_return_type(p_president_id int)
returns void as $$
begin
    insert into some_table(president_id)
    select p_president_id;
end;
$$ language plpgsql;

-- Creating the same function using $funct$
create or replace function f_no_return_type(p_president_id int)
returns void as $funct$
begin
    insert into some_table(president_id)
    select p_president_id;
end;
$funct$ language plpgsql;

-- More to come