use city;
SET NAMES utf8;
drop table if exists cities;
create table cities (id varchar(10) primary key, name text, population int, date_mod date);
quit
