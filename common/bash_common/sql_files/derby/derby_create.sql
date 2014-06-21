connect 'jdbc:derby://localhost:1527/city_aaa;create=true';
drop table cities;
create table cities (id varchar(10), name varchar(20), population int, date_mod date);
commit;
quit;
