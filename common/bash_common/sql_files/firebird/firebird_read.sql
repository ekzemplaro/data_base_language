set names utf8;
connect "/var/tmp/firebird/cities.fdb" user 'SYSDBA' password 'tiger';
select id,name,population,date_mod from cities;
quit;
