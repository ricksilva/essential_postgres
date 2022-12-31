drop table if exists us_president;

create table us_president (
    president_id    int,
    president_name  text,
    president_party text
);

-- Add rows to the table
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

-- Set Andrew back to a Democrat
update  us_president
set     president_party = 'Democrat'
where   president_id = 7;

drop table if exists employee;

create table employee
    (
    employee_id     int,
    employee_name   text,
    title           text,
    salary          decimal(12,2)
);

insert into employee(employee_id, employee_name, title, salary)
values (1, 'Dave Nelson', 'CEO', 980000);

insert into employee(employee_id, employee_name, title, salary)
values (2, 'Rob Field', 'Sales Manager', 349000);

insert into employee(employee_id, employee_name, title, salary)
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

-- The change is not reflected in the materialized view. Andrew Jackson still appears as a Democrat.
select  *
from    mv_democrat_president
where   president_id = 7;

refresh materialized view mv_democrat_president;

-- Now the change is reflected in the materialized view. Jackson is not returned.
select  *
from    mv_democrat_president
where   president_id = 7;

-- Create a sequence called president_sequence and use it to increment the
-- value of the president_id column in the us_president table.
drop sequence if exists president_sequence;

create sequence president_sequence;

-- Remove all rows from the us_president table
delete from us_president;

-- Reinsert the rows using the sequence
insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'George Washington', null);

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'John Adams', 'Federalist');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Thomas Jefferson', 'Democratic-Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'James Madison', 'Democratic-Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'James Monroe', 'Democratic-Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'John Quincy Adams', 'Democratic-Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Andrew Jackson', 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Martin Van Buren', 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'William Harrison', 'Whig');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'John Tyler', 'Whig');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'James Polk' , 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Zachary Taylor', 'Whig');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Millard Fillmore', 'Whig');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Franklin Pierce' , 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'James Buchanan', 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Abraham Lincoln', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Andrew Johnson', 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Ulysses Grant', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Rutherford Hayes', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'James Abram Garfield', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Chester Arthur', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Grover Cleveland', 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Benjamin Harrison', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Grover Cleveland', 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'William McKinley', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Theodore Roosevelt', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'William Taft', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Woodrow Wilson', 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Warren Harding', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Calvin Coolidge', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Herbert Hoover', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Franklin Roosevelt', 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Harry Truman', 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Dwight Eisenhower', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'John Kennedy', 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Lyndon Johnson', 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Richard Nixon', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Gerald Ford', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Jimmy Carter', 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Ronald Reagan', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'George Herbert Walker Bush', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Bill Clinton', 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'George W. Bush', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Barack Obama', 'Democrat');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Donald Trump', 'Republican');

insert into us_president (president_id, president_name, president_party)
values (nextval('president_sequence'), 'Joe Biden', 'Democrat');

select * from us_president;

select upper('Say it loud');

-- Writing a function called f_get_president_and_party()
create or replace function f_get_president_and_party(int) returns text as $$
	select  concat(president_name, ' (', president_party, ')')
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
    v_current_text text = '';
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

    return  concat('President ID: ', p_president_id, ' Name: ', v_president_name,
            ' Political Party: ', v_president_party, ' ', v_current_text);			
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

-- Create a function called f_get_president()
create or replace function f_get_president(p_president_id int, p_party text)
returns text as $$
declare
    v_president_name text;

begin
    select  president_name
    into    v_president_name
    from    us_president
    where   president_id = p_president_id
    and     president_party = p_party;

    return  v_president_name;

end;
$$ language plpgsql;

-- Calling the f_get_president() function. Passing parameters by position.
select f_get_president
(
        33,
        'Democrat'
);

-- Calling the f_get_president() function. Passing parameters by name.
select f_get_president
(
        p_president_id => 33,
        p_party => 'Democrat'
);

-- We can switch the order of the parameters
select f_get_president
(
        p_party => 'Democrat',
        p_president_id => 33
);

-- Parameter types in and out
create or replace function f_multiply_by_5(
    in      p_in    int,
    out     p_out   int
) as $$
begin
    select  p_in * 5
    into    p_out;
end;
$$ language plpgsql;

-- Calling the f_multiply_by_5() function
select f_multiply_by_5(3);

drop function f_multiply_by_5(int);

-- Rewriting the function using one inout parameter
create or replace function f_multiply_by_5(
    inout   p_inout     int
) as $$
begin
    select  p_inout * 5
    into    p_inout;
end;
$$ language plpgsql;

-- Calling the function
select f_multiply_by_5(3);

-- A function with a variadic parameter
create or replace function f_multiply_together(variadic p_nums int[])
returns int as $$
declare
    v_tot int = 1;
    v_ind int;
begin
    foreach v_ind in array p_nums loop
        v_tot = v_tot * v_ind;
    end loop;
    return v_tot;
end;
$$ language plpgsql;

-- Calling the function
select f_multiply_together(3,5,2);
select f_multiply_together(1,2,3,4,5)
select f_multiply_together(12,4,9,8,1,333,1,87,5,2);

-- Creating a procedure
create or replace procedure proc_multiply_by_5(
    inout   p_inout     int
) as $$
begin
    select  p_inout * 5
    into    p_inout;
end;
$$ language plpgsql;

-- Caling the procedure
call proc_multiply_by_5(3);

--
-- Triggers
--

drop table if exists us_president_insert_audit;

-- Creating the audit table
create table us_president_insert_audit (
    insert_user     text,
    insert_date     timestamp with time zone,
    president_id    int,
    president_name  text,
    president_party text
);

-- Creating the trigger function
create or replace function tf_us_president_insert_audit()
returns trigger as $$
begin
    insert into us_president_insert_audit
    (
        insert_user,
        insert_date,
        president_id,
        president_name,
        president_party
    )
    values
    (
        current_user,
        now(),
        new.president_id,
        new.president_name,
        new.president_party
    );
    return new;
    end;
    $$ language plpgsql;

select current_user;

select now();

-- Creating the trigger
create trigger tr_us_president_insert_audit
after insert on us_president
for each row
execute function tf_us_president_insert_audit();

-- Inserting this row will cause the trigger to fire and write to the us_president_insert_audit table
insert into us_president
(
    president_id,
    president_name,
    president_party
)
values
(
    47,
    'Hillary Clinton',
    'Democrat'
);

select * from us_president_insert_audit;

-- Auditing updates
create trigger tr_us_president_update_audit
after insert on us_president
for each row
execute function tf_us_president_update_audit();

-- Auditing deletes
create trigger tr_us_president_delete_audit
after delete on us_president
for each row
execute function tf_us_president_delete_audit();

-- One trigger to audit inserts, updates, or deletes
create trigger tr_us_president_audit
after insert or update or delete on us_president
for each row execute function tf_us_president_audit();

alter trigger tr_us_president_insert_audit on us_president rename to tr_us_pres_ins_aud;

drop trigger tr_us_pres_ins_aud on us_president;

alter table us_president
disable trigger tr_us_president_insert_audit;

alter table us_president
enable trigger tr_us_president_insert_audit;

drop function tf_us_president_insert_audit();

drop table us_president_insert_audit;
