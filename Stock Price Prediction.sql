-- Create a database for all data
create database stock;
use stock;

-- 1. Create a table for Amazon 
-- ("date" is primary key with date type, all columns with 4 decimals, "volume" with integers, "Company" with characters)
create table amazon(
dates date,
high_price decimal(15,4),
low_price decimal(15,4),
open_price decimal(15,4),
close_price decimal(15,4),
volume decimal(15,0),
adj_close_price decimal(15,4));
select * from amazon;

-- Drop "adj_close_price" column, add "company" column for "amazon"
alter table amazon drop column adj_close_price;
alter table amazon add company varchar(10) default 'amazon';
select * from amazon;
describe amazon;
update amazon set company = replace(company,'amazon','Amazon');
select count(*) from amazon;      -- 5,286 records

-- Do the same to create tables for other companies

-- 2. Create a table for Coca Cola 
create table coke(
dates date,
high_price decimal(15,4),
low_price decimal(15,4),
open_price decimal(15,4),
close_price decimal(15,4),
volume decimal(15,0),
adj_close_price decimal(15,4));
select * from coke;

alter table coke drop column adj_close_price;
alter table coke add company varchar(10) default 'Coca Cola';
select * from coke;
describe coke;
select count(*) from coke;      -- 5,286 records

 -- 3. Create a table for JP Morgan Chase 
create table chase(
dates date,
high_price decimal(15,4),
low_price decimal(15,4),
open_price decimal(15,4),
close_price decimal(15,4),
volume decimal(15,0),
adj_close_price decimal(15,4));
select * from chase;
-- drop table chase;
alter table chase drop column adj_close_price;
alter table chase add company varchar(10) default 'Chase';
select * from chase;
describe chase;
select count(*) from chase;      -- 5,286 records

-- 4. Create a table for Microsoft 
create table microsoft(
dates date,
high_price decimal(15,4),
low_price decimal(15,4),
open_price decimal(15,4),
close_price decimal(15,4),
volume decimal(15,0),
adj_close_price decimal(15,4));
select * from microsoft;

alter table microsoft drop column adj_close_price;
alter table microsoft add company varchar(10) default 'Microsoft';
select * from microsoft;
describe microsoft;
select count(*) from microsoft;      -- 5,286 records

-- 5. Create a table for toyota 
create table toyota(
dates date,
high_price decimal(15,4),
low_price decimal(15,4),
open_price decimal(15,4),
close_price decimal(15,4),
volume decimal(15,0),
adj_close_price decimal(15,4));
select * from toyota;

alter table toyota drop column adj_close_price;
alter table toyota add company varchar(10) default 'Toyota';
select * from toyota;
describe toyota;
select count(*) from toyota;      -- 5,286 records

-- 6. Create a table for Walmart 
create table walmart(
dates date,
high_price decimal(15,4),
low_price decimal(15,4),
open_price decimal(15,4),
close_price decimal(15,4),
volume decimal(15,0),
adj_close_price decimal(15,4));
select * from walmart;

alter table walmart drop column adj_close_price;
alter table walmart add company varchar(10) default 'Walmart';
select * from walmart;
describe walmart;
select count(*) from walmart;      -- 5,286 records

-- 7. Create a table for S&P500 
create table sp500(
dates date,
high_price decimal(15,4),
low_price decimal(15,4),
open_price decimal(15,4),
close_price decimal(15,4),
volume decimal(15,0),
adj_close_price decimal(15,4));
select * from sp500;

alter table sp500 drop column adj_close_price;
alter table sp500 add company varchar(10) default 'S&P500';
select * from sp500;
describe sp500;
select count(*) from sp500;      -- 5,286 records

-- 8. Create a table for all combined companies
create view stockprices as
select * from amazon
union select * from coke 
union select * from chase
union select * from microsoft
union select * from toyota
union select * from walmart
union select * from sp500;

-- 9. Show data for all companies for each date
create table allstock as
select * from stockprices group by dates, company;
select * from allstock;
describe allstock;
select count(*) from allstock;   -- 37,002 rows, 7 columns

-- 10. Rearrange 'company' column after dates
show create table allstock;
alter table allstock change column company company VARCHAR(10) after dates;
select * from allstock;          -- final table

-- 11. Check for missing values
select * from allstock
where dates is null 
or company is null 
or high_price is null 
or low_price is null 
or open_price is null 
or close_price is null 
or volume is null;                -- no missing data

-- 12. Rank companies by average volume of stock
select company, avg(volume) avg_vol from allstock where company != 'S&P500' group by company order by avg_vol desc -- limit 1; 
-- after S&P500, Microsoft, Chase, Walmart have the highest avg volumes, Coca Cola has the lowest avg volume.

-- 13. Rank companies by average close price
select company, avg(close_price) avg_close_price from allstock group by company order by avg_close_price desc;
-- Amazon has the highest avg close price, Microsoft has the lowest avg close price despite its highest avg volume.

-- 14. Max close price by company
select company, max(close_price) max_close_price, min(close_price) min_close_price
from allstock group by company order by max_close_price desc, min_close_price desc;
-- Amazon has the highest max close price, Walmart has the lowest max close price and the highest min close price

