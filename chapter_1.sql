-- If the us_president table already exists, drop it before we recreate it
drop table if exists us_president;

-- Create the table
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

-- Selecting all 3 columns for all parties
select  president_id,
        president_name,
        president_party
from    us_president;

-- Selecting all 3 columns for just Republicans
select  president_id,
        president_name,
        president_party
from    us_president
where   president_party = 'Republican';

-- Since we know these are just the Republicans, let's not select the president_party column
select  president_id,
        president_name
from    us_president
where   president_party = 'Republican';

-- Ordering the results by party and president_id
select  president_id,
        president_name,
        president_party
from    us_president
order by president_party,
        president_id;

-- "asc" is for ascending order, and "desc" is for descending order. (The default is "asc").
select  president_id,
        president_name,
        president_party
from    us_president
order by president_party desc,
        president_id asc;

-- Selecting presidents that have a null party
select  president_id,
        president_name,
        president_party
from    us_president
where   president_party is null;

-- Selecting presidents that DO NOT have a null party
select  president_id,
        president_name,
        president_party
from    us_president
where   president_party is not null;

-- The following two queries aren't formatted nicely like the ones above, but they do work.
select president_id, president_name, president_party from
us_president;

select president_id, president_name, president_party
from us_president;

-- Using the * wildcard to select all columns from the table.
select * from us_president;

-- The query above returns the same values as this query:
select president_id, president_name, president_party from us_president;

-- Adding a comment on the 3rd line
select  president_id,
        president_name,
        president_party -- Political party, not birthday
from    us_president;

-- Here's a multi-line comment:
/*
This query retrieves all the US Presidents.
There sure are a lot of them!
*/
select * from us_president;

-- Calling the upper() function with 'Say it loud' as the argument
select upper('Say it loud');

-- Selecting the 10th president in uppercase
select  upper(president_name)
from    us_president
where   president_id = 10;

-- Calling the coalesce() function.
-- If the president's party is null, display 'No Political Party'.
select  president_name,
        coalesce(president_party, 'No Political Party')
from    us_president;

-- Aggregate functions
select  count(*)
from    us_president;

select  max(president_id)
from    us_president;

select  min(president_id)
from    us_president;

select  president_party,
        count(*)
from    us_president
group by president_party;

-- This SQL query returns an error because there is no "group by"
select  president_party,
        count(*)
from    us_president;

-- This query works. Adding the "group by" fixed it.
select  president_party,
        count(*)
from    us_president
group by president_party;

-- This SQL query also returns an error because there is no "group by"
select  president_party,
        max(president_id)
from    us_president;

-- This query works. Adding the "group by" fixed it.
select  president_party,
        max(president_id)
from    us_president
group by president_party;

-- This query fails because it has no "group by"
select  continent,
        country,
        sum(population),
        sum(area)
from    world_population;

-- The fix is to add the "group by"
select  continent,
        country,
        sum(population),
        sum(area)
from    world_population
group by continent,
        country;

-- How many times is each president in the us_president table?
select  president_name,
        count(*)
from    us_president
group by president_name;

-- Using "having" to find any presidents who are in the table twice.
-- Oh Grover Cleveland, when will you ever learn?
select  president_name,
        count(*)
from    us_president
group by president_name
having count(*) > 1;

-- Selecting Republicans
select  president_id,
        president_name,
        president_party
from    us_president
where   president_party = 'Republican';

-- Let's create a new political_party table and change the
-- us_president table so that it gets the party from the political_party table.

drop table if exists political_party;

create table political_party
    (
    party_id    int,
    party_name  text
    );

insert into political_party(party_id, party_name) values (1, 'Republican');
insert into political_party(party_id, party_name) values (2, 'Democrat-Republican');
insert into political_party(party_id, party_name) values (3, 'Federalist');
insert into political_party(party_id, party_name) values (4, 'Democrat');
insert into political_party(party_id, party_name) values (5, 'Whig');

-- Drop and recreate the us_president table.
-- This time, we'll have a party_id column instead of a party_name column.
drop table if exists us_president;

create table us_president (
    president_id    int,
    president_name  text,
    party_id        int
);

insert into us_president(president_id, president_name, party_id) values (1, 'George Washington', null);
insert into us_president(president_id, president_name, party_id) values (2, 'John Adams', 3);
insert into us_president(president_id, president_name, party_id) values (3, 'Thomas Jefferson', 2);
insert into us_president(president_id, president_name, party_id) values (4, 'James Madison', 2);
insert into us_president(president_id, president_name, party_id) values (5, 'James Monroe', 2);
insert into us_president(president_id, president_name, party_id) values (6, 'John Quincy Adams', 2);
insert into us_president(president_id, president_name, party_id) values (7, 'Andrew Jackson', 4);
insert into us_president(president_id, president_name, party_id) values (8, 'Martin Van Buren', 4);
insert into us_president(president_id, president_name, party_id) values (9, 'William Harrison', 5);
insert into us_president(president_id, president_name, party_id) values (10, 'John Tyler', 5);
insert into us_president(president_id, president_name, party_id) values (11, 'James Polk' , 4);
insert into us_president(president_id, president_name, party_id) values (12, 'Zachary Taylor', 5);
insert into us_president(president_id, president_name, party_id) values (13, 'Millard Fillmore', 5);
insert into us_president(president_id, president_name, party_id) values (14, 'Franklin Pierce' , 4);
insert into us_president(president_id, president_name, party_id) values (15, 'James Buchanan', 4);
insert into us_president(president_id, president_name, party_id) values (16, 'Abraham Lincoln', 1);
insert into us_president(president_id, president_name, party_id) values (17, 'Andrew Johnson', 4);
insert into us_president(president_id, president_name, party_id) values (18, 'Ulysses Grant', 1);
insert into us_president(president_id, president_name, party_id) values (19, 'Rutherford Hayes', 1);
insert into us_president(president_id, president_name, party_id) values (20, 'James Abram Garfield', 1);
insert into us_president(president_id, president_name, party_id) values (21, 'Chester Arthur', 1);
insert into us_president(president_id, president_name, party_id) values (22, 'Grover Cleveland', 4);
insert into us_president(president_id, president_name, party_id) values (23, 'Benjamin Harrison', 1);
insert into us_president(president_id, president_name, party_id) values (24, 'Grover Cleveland', 4);
insert into us_president(president_id, president_name, party_id) values (25, 'William McKinley', 1);
insert into us_president(president_id, president_name, party_id) values (26, 'Theodore Roosevelt', 1);
insert into us_president(president_id, president_name, party_id) values (27, 'William Taft', 1);
insert into us_president(president_id, president_name, party_id) values (28, 'Woodrow Wilson', 4);
insert into us_president(president_id, president_name, party_id) values (29, 'Warren Harding', 1);
insert into us_president(president_id, president_name, party_id) values (30, 'Calvin Coolidge', 1);
insert into us_president(president_id, president_name, party_id) values (31, 'Herbert Hoover', 1);
insert into us_president(president_id, president_name, party_id) values (32, 'Franklin Roosevelt', 4);
insert into us_president(president_id, president_name, party_id) values (33, 'Harry Truman', 4);
insert into us_president(president_id, president_name, party_id) values (34, 'Dwight Eisenhower', 1);
insert into us_president(president_id, president_name, party_id) values (35, 'John Kennedy', 4);
insert into us_president(president_id, president_name, party_id) values (36, 'Lyndon Johnson', 4);
insert into us_president(president_id, president_name, party_id) values (37, 'Richard Nixon', 1);
insert into us_president(president_id, president_name, party_id) values (38, 'Gerald Ford', 1);
insert into us_president(president_id, president_name, party_id) values (39, 'Jimmy Carter', 4);
insert into us_president(president_id, president_name, party_id) values (40, 'Ronald Reagan', 1);
insert into us_president(president_id, president_name, party_id) values (41, 'George Herbert Walker Bush', 1);
insert into us_president(president_id, president_name, party_id) values (42, 'Bill Clinton', 4);
insert into us_president(president_id, president_name, party_id) values (43, 'George W. Bush', 1);
insert into us_president(president_id, president_name, party_id) values (44, 'Barack Obama', 4);
insert into us_president(president_id, president_name, party_id) values (45, 'Donald Trump', 1);
insert into us_president(president_id, president_name, party_id) values (46, 'Joe Biden', 4);

-- join the tables using an inner join
select  us_president.president_id,
        us_president.president_name,
        political_party.party_name
from    us_president
inner join political_party
on      us_president.party_id = political_party.party_id;

-- Aliasing the us_president table as "a" and the political_party table as "b"
select  a.president_id,
        a.president_name,
        b.party_name
from    us_president a
inner join political_party b
on      a.party_id = b.party_id;

-- You can also use the "as" keyword
select  a.president_id,
        a.president_name,
        b.party_name
from    us_president as a
inner join political_party as b
on      a.party_id = b.party_id;

-- To do an inner join, you can use "join" instead of "inner join".
select  a.president_id,
        a.president_name,
        b.party_name
from    us_president a
join political_party b
on      a.party_id = b.party_id;

drop table if exists customer;

create table customer
    (
    customer_id     int,
    customer_name   text
    );

insert into customer (customer_id, customer_name) values (1, 'Penny Sato');
insert into customer (customer_id, customer_name) values (2, 'Dixie Gooseman');
insert into customer (customer_id, customer_name) values (3, 'Molly Terry');

drop table if exists item_ordered;

create table item_ordered
    (
    order_id        int,
    customer_id     int,
    item_ordered    text
    );

insert into item_ordered (order_id, customer_id, item_ordered) values (90, 1, 'Hat');
insert into item_ordered (order_id, customer_id, item_ordered) values (91, 2, 'Gloves');

-- An inner join. Using just the keyword "join" without the word "inner".
select  a.customer_name,
        b.item_ordered
from    customer a
join    item_ordered b
on      a.customer_id = b.customer_id;

-- A left outer join
select  a.president_id,
        a.president_name,
        b.party_name
from    us_president a left outer join political_party b
on      a.party_id = b.party_id;

-- This right outer join is the equivilent of the left outer join above.
-- The table order has been switched. Now that us_president is the RIGHT table, we do a RIGHT outer join.
select  a.president_id,
        a.president_name,
        b.party_name
from    political_party b right outer join us_president a
on      a.party_id = b.party_id;

drop table if exists bookstore;

create table bookstore
    (
    store_id    int,
    store_name  text
    );

insert into bookstore(store_id, store_name) values (1, 'Mall Store');
insert into bookstore(store_id, store_name) values (2, 'College Campus Bookstore');
insert into bookstore(store_id, store_name) values (3, 'Suburban Store');
insert into bookstore(store_id, store_name) values (4, 'Cellar Store');

drop table if exists new_book;

create table new_book
    (
    book_id     int,
    book_name   text
    );

insert into new_book (book_id, book_name) values (100, 'Essential Postgres');
insert into new_book (book_id, book_name) values (200, 'How to Knit');
insert into new_book (book_id, book_name) values (300, 'Poetry for Dogs');

-- Cross Join
select  b.store_name,
        n.book_name
from    bookstore b
cross join new_book n;

drop table if exists church_hierarchy;

create table church_hierarchy
    (
    position_id     int,
    position_desc   text,
    supervisor_id   int
    );

insert into church_hierarchy(position_id, position_desc,supervisor_id)
values (1, 'God', null);

insert into church_hierarchy(position_id, position_desc,supervisor_id)
values (2, 'Pope', 1);

insert into church_hierarchy(position_id, position_desc,supervisor_id)
values (3, 'Cardinal', 2);

insert into church_hierarchy(position_id, position_desc,supervisor_id)
values (4, 'Bishop', 3);

insert into church_hierarchy(position_id, position_desc,supervisor_id)
values (5, 'Priest', 4);

-- A self join. We are joining the church_hierarchy table to itself.
select  a.position_desc,
        b.position_desc
from    church_hierarchy a
join    church_hierarchy b
on      a.position_id = b.supervisor_id;

-- Using column aliasing to display the columns as Supervisor and Worker
select  a.position_desc Supervisor,
        b.position_desc Worker
from    church_hierarchy a
join    church_hierarchy b
on      a.position_id = b.supervisor_id;

-- A query that doesn't use parens on the last line
select  a.customer_name,
        b.item_ordered
from    customer a
join    item_ordered b
on      a.customer_id = b.customer_id;

-- The same query using parens on the last line
select  a.customer_name,
        b.item_ordered
from    customer a
join    item_ordered b
on      (a.customer_id = b.customer_id);

-- The same query with the "using" syntax instead of the "on" syntax on the last line
select  a.customer_name,
        b.item_ordered
from    customer a
join    item_ordered b
using   (customer_id);

-- Old-School SQL
select  a.customer_name,
        b.item_ordered
from    customer a,
        item_ordered b
where   a.customer_id = b.customer_id;

drop table if exists store;

create table store
    (
    store_id    int,
    store_name  text
    );

insert into store(store_id, store_name) values (1, 'Bill''s Banjos');
insert into store(store_id, store_name) values (2, 'Mike''s Music Emporium');
insert into store(store_id, store_name) values (3, 'Tennessee Instruments');

drop table if exists supplier;

create table supplier
    (
    supplier_id     int,
    supplier_name   text
    );

insert into supplier(supplier_id, supplier_name) values (100, 'Missing Teeth Mfg.');
insert into supplier(supplier_id, supplier_name) values (200, 'Peg''s Board Guitar Co.');
insert into supplier(supplier_id, supplier_name) values (300, 'Scratchy Cat Fiddle Co.');

drop table if exists product;

create table product
    (
    product_id      int,
    product_name    text,
    supplier_id     int
    );

insert into product (product_id, product_name, supplier_id) values (11, 'Banjo', 100);
insert into product (product_id, product_name, supplier_id) values (22, 'Guitar', 200);
insert into product (product_id, product_name, supplier_id) values (33, 'Fiddle', 300);

drop table if exists inventory;

create table inventory
    (
    store_id    int,
    product_id  int,
    quantity    int
    );

insert into inventory(store_id, product_id, quantity) values (1, 11, 5);
insert into inventory(store_id, product_id, quantity) values (2, 22, 9);
insert into inventory(store_id, product_id, quantity) values (2, 11, 2);
insert into inventory(store_id, product_id, quantity) values (3, 33, 12);
insert into inventory(store_id, product_id, quantity) values (3, 11, 4);

select  a.store_name,
        b.product_name,
        c.supplier_name,
        d.quantity
from    store a
join    inventory d on d.store_id = a.store_id
join    product b on b.product_id = d.product_id
join    supplier c on c.supplier_id = b.supplier_id
order by a.store_name;

-- Using the table aliases st for store, i for inventory, p for product, sp for supplier
select  st.store_name,
        p.product_name,
        sp.supplier_name,
        i.quantity
from    store st
join    inventory i on i.store_id = st.store_id
join    product p on p.product_id = i.product_id
join    supplier sp on sp.supplier_id = p.supplier_id
order by st.store_name;

-- We just got a new Mandolin in, but we don't know the supplier
insert into product (product_id, product_name, supplier_id) values (44, 'Mandolin', null);
insert into inventory(store_id, product_id, quantity) values (3, 44, 1);

-- Our query doesn't show the new Mandolin
select  a.store_name,
        b.product_name,
        c.supplier_name,
        d.quantity
from    store a
join    inventory d on d.store_id = a.store_id
join    product b on b.product_id = d.product_id
join    supplier c on c.supplier_id = b.supplier_id -- Our inner join finds no match in the supplier table
order by a.store_name;

-- This change to the query causes the mandolin to appear.
-- Adding the word "left" on the second-to-last line changes the join between
-- the supplier table and the product table from an inner join to a left outer join.
select  a.store_name,
        b.product_name,
        c.supplier_name,
        d.quantity
from    store a
join    inventory d on d.store_id = a.store_id
join    product b on b.product_id = d.product_id
left join supplier c on c.supplier_id = b.supplier_id -- Added the word "left" here
order by a.store_name;

-- Recreating the us_president in its original form for the next few examples
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

-- String concatonation with ||
select  president_name || ' (' || president_party || ')'
from    us_president;

-- Greater Than
select  *
from    us_president
where   president_id > 40;

-- Greater Than or Equal To
select  *
from    us_president
where   president_id >= 40;

-- Less Than
select  *
from    us_president
where   president_id < 5;

-- Less Than or Equal To
select  *
from    us_president
where   president_id <= 5;

-- Not Equal (two ways)
select  *
from    product
where   product_name != 'Mandolin'
and     product_id != 11;

select  *
from    product
where   product_name <> 'Mandolin'
and     product_id <> 11;

-- In
select  *
from    store
where   store_id in (1,3);

-- Using the "or" keyword
select  *
from    store
where   store_id = 1
or      store_id = 3;

-- Create and load the south_east_store table
drop table if exists south_east_store;

create table south_east_store
    (
    store_id    int
    );

insert into south_east_store(store_id) values (1);
insert into south_east_store(store_id) values (3);

-- "In" with a subquery
select  *
from    store
where   store_id in
        (
        select  store_id
        from    south_east_store
        );

-- Between
select  *
from    product
where   product_id between 11 and 33;

-- like
select  president_name
from    us_president
where   president_name like 'George%';

-- Like using _ wildcard for one character
select  president_name
from    us_president
where   president_name like '_oNaLd%';

-- ilike
select  president_name
from    us_president
where   president_name ilike '_oNaLd%';

-- is null
select  *
from    product
where   supplier_id is null;

-- is not null
select  *
from    product
where   supplier_id is not null;

-- not in
select  *
from    product
where   supplier_id not in (11, 22);

-- not like
select  president_name
from    us_president
where   president_name not like '_onald%';

-- not between
select  *
from    product
where   product_id not between 11 and 33;

drop table if exists emergency_message;

create table emergency_message
    (
    tornado_alert_message   text
    );

insert into emergency_message(tornado_alert_message)
values ('There is a tornado alert');

drop table if exists tornado_alert;

create table tornado_alert
    (
    state       text,
    alert_flag  text
    );

insert into tornado_alert (state, alert_flag) values ('Massachusetts', 'N');
insert into tornado_alert (state, alert_flag) values ('North Carolina', 'Y');
insert into tornado_alert (state, alert_flag) values ('Florida', 'N');

-- exists with subquery
select  tornado_alert_message
from    emergency_message
where exists
        (
        select  *
        from    tornado_alert
        where   alert_flag = 'Y'
        );

select  tornado_alert_message -- outer query
from    emergency_message -- outer query
where   exists -- outer query
        (
        select  * -- inner query (subquery)
        from    tornado_alert -- inner query (subquery)
        where   alert_flag = 'Y' -- inner query (subquery)
        );

select  *
from    tornado_alert;

-- Correlated subquery
select  store_name
from    store s
where   exists
        (
        select  i.store_id
        from    inventory i
        where   i.store_id = s.store_id -- joining the tables here
        and     i.quantity > 10
        );

-- A subquery that returns one row
select  store_name
from    store s
where   s.store_id =
        (
        select  i.store_id
        from    inventory i
        where   i.quantity > 10
        );

-- Just the inner query in isolation
select  i.store_id
from    inventory i
where   i.quantity > 10;

-- Add a shipment of banjos then run the same query
insert into inventory(store_id, product_id, quantity) values (1, 11, 27);

-- The inner query in isolation again
select  i.store_id
from    inventory i
where   i.quantity > 10;

-- Now the query produces an error
select  store_name
from    store s
where   s.store_id =
        (
        select  i.store_id
        from    inventory i
        where   i.quantity > 10
        );

-- Replacing "=" with "in" allows the outer query to handle multiple rows returned from the subquery
select  store_name
from    store s
where   s.store_id in
        (
        select  i.store_id
        from    inventory i
        where   i.quantity > 10
        );

select  president_party
from    us_president;

select distinct president_party
from    us_president;

select  *
from    us_president
limit 5;
