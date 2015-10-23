set names utf8;
connect "/var/tmp/firebird/cities.fdb" user 'SYSDBA' password 'tiger';
drop table cities;
commit;
create table cities (id varchar(10), name varchar(20), population int, date_mod date);
commit;
quit;

