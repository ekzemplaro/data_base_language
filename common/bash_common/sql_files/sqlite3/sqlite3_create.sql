PRAGMA encoding = "UTF-8";
drop table if exists cities;
create TABLE cities (
id text NOT NULL PRIMARY KEY,
name text,
population int,
date_mod text);
