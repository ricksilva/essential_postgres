drop table us_president;

create table us_president (
	president_id	int,
	president_name	text,
	president_party	text
)

insert into us_president values (1, 'George Washington', null);
insert into us_president values (2, 'John Adams', 'Federalist');
insert into us_president values (3, 'Thomas Jefferson', 'Democratic-Republican');
insert into us_president values (4, 'James Madison', 'Democratic-Republican');
insert into us_president values (5, 'James Monroe', 'Democratic-Republican');
insert into us_president values (6, 'John Quincy Adams', 'Democratic-Republican');
insert into us_president values (7, 'Andrew Jackson', 'Democrat');
insert into us_president values (8, 'Martin Van Buren', 'Democrat');
insert into us_president values (9, 'William Harrison', 'Whig');
insert into us_president values (10, 'John Tyler', 'Whig');
insert into us_president values (11, 'James Polk' , 'Democrat');
insert into us_president values (12, 'Zachary Taylor', 'Whig');
insert into us_president values (13, 'Millard Fillmore', 'Whig');
insert into us_president values (14, 'Franklin Pierce' , 'Democrat');
insert into us_president values (15, 'James Buchanan', 'Democrat');
insert into us_president values (16, 'Abraham Lincoln', 'Republican');
insert into us_president values (17, 'Andrew Johnson', 'Democrat');
insert into us_president values (18, 'Ulysses Grant', 'Republican');
insert into us_president values (19, 'Rutherford Hayes', 'Republican');
insert into us_president values (20, 'James Abram Garfield', 'Republican');
insert into us_president values (21, 'Chester Arthur', 'Republican');
insert into us_president values (22, 'Grover Cleveland', 'Democrat');
insert into us_president values (23, 'Benjamin Harrison', 'Republican');
insert into us_president values (24, 'Grover Cleveland', 'Democrat');
insert into us_president values (25, 'William McKinley', 'Republican');
insert into us_president values (26, 'Theodore Roosevelt', 'Republican');
insert into us_president values (27, 'William Taft', 'Republican');
insert into us_president values (28, 'Woodrow Wilson', 'Democrat');
insert into us_president values (29, 'Warren Harding', 'Republican');
insert into us_president values (30, 'Calvin Coolidge', 'Republican');
insert into us_president values (31, 'Herbert Hoover', 'Republican');
insert into us_president values (32, 'Franklin Roosevelt', 'Democrat');
insert into us_president values (33, 'Harry Truman', 'Democrat');
insert into us_president values (34, 'Dwight Eisenhower', 'Republican');
insert into us_president values (35, 'John Kennedy', 'Democrat');
insert into us_president values (36, 'Lyndon Johnson', 'Democrat');
insert into us_president values (37, 'Richard Nixon', 'Republican');
insert into us_president values (38, 'Gerald Ford', 'Republican');
insert into us_president values (39, 'Jimmy Carter', 'Democrat');
insert into us_president values (40, 'Ronald Reagan', 'Republican');
insert into us_president values (41, 'George Herbert Walker Bush', 'Republican');
insert into us_president values (42, 'Bill Clinton', 'Democrat');
insert into us_president values (43, 'George W. Bush', 'Republican');
insert into us_president values (44, 'Barack Obama', 'Democrat');
insert into us_president values (45, 'Donald Trump', 'Republican');
insert into us_president values (46, 'Joe Biden', 'Democrat');

-- Selecting all 3 columns for all parties
select	president_id,
		president_name,
		president_party
from	us_president;

-- Selecting all 3 columns for just Republicans
select	president_id,
		president_name,
		president_party
from	us_president
where	president_party = 'Republican';

-- Since we know these are just the Republicans, 
-- let's not select the president_party column
select 	president_id,
		president_name
from	us_president
where 	president_party = 'Republican';

-- Ordering the results by party and president_id
select 	president_id,
		president_name,
		president_party
from	us_president
order by president_party, 
		president_id;

-- "asc" is for ascending order, and "desc" is for descending order. (The default is "asc").
select	president_id,
		president_name,
		president_party
from	us_president
order by president_party desc,
		president_id asc;
		
-- Selecting presidents that have a null party
select	president_id,
		president_name,
		president_party
from	us_president
where	president_party is null;

-- Selecting presidents that DO NOT have a null party
select	president_id,
		president_name,
		president_party
from	us_president
where	president_party is not null;

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
select	president_id,
		president_name,
		president_party -- Political party, not birthday
from 	us_president;

-- Here's a multi-line comment:
/*
This query retrieves all the US Presidents.
There sure are a lot of them!
*/
select * from us_president;

-- Calling the upper() function with 'Say it loud' as the argument
select upper('Say it loud');

-- Selecting the 10th president in uppercase
select	upper(president_name)
from 	us_president 
where 	president_id = 10;

-- Calling the coalesce() function.
-- If the president's party is null, display 'No Political Party'.
select	president_name,
		coalesce(president_party, 'No Political Party')
from 	us_president;

-- Aggregate functions
select 	count(*)
from 	us_president;

select 	max(president_id) 
from 	us_president;

select 	min(president_id)
from 	us_president;

select 	president_party, 
		count(*)
from 	us_president 
group by president_party;

-- This SQL query returns an error because there is no "group by"
select	president_party,
		count(*)
from 	us_president;

-- This query works. Adding the "group by" fixed it.
select	president_party,
		count(*)
from 	us_president
group by president_party;

-- This SQL query also returns an error because there is no "group by"
select 	president_party,
		max(president_id)
from 	us_president;

-- This query works. Adding the "group by" fixed it.
select 	president_party,
		max(president_id)
from 	us_president
group by president_party;

-- This query fails because it has no "group by"
select	continent,
		country,
		sum(population),
		sum(area)
from	world_population;

-- The fix is to add the "group by"
select	continent,
		country,
		sum(population),
		sum(area)
from	world_population
group by continent, 
		country;
		
-- How many times is each president in the us_president table?
select	president_name,
		count(*)
from	us_president
group by president_name;

-- Using "having" to find any presidents who are in the table twice.
-- Oh, Grover Cleveland. When will you ever learn?
select	president_name,
		count(*)
from	us_president
group by president_name
having count(*) > 1;

-- Selecting Republicans
select	president_id,
		president_name,
		president_party
from	us_president
where	president_party = 'Republican';

