connect to cities user scott using tiger;
drop table cities;
create table cities (id varchar(10) not null primary key, name varchar(32), population int, date_mod date);
