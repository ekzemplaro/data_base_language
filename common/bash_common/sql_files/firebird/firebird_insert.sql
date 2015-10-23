set names utf8;
connect "/var/tmp/firebird/cities.fdb" user 'SYSDBA' password 'tiger';

insert into cities (id,name,population,date_mod) values
 ('t3821','松山',62517,CAST ('2001-5-15' as date));
insert into cities (id,name,population,date_mod) values
 ('t3822','今治',72986,CAST ('2001-2-28' as date));
insert into cities (id,name,population,date_mod) values
 ('t3823','宇和島',62925,CAST ('2001-7-16' as date));
insert into cities (id,name,population,date_mod) values
 ('t3824','八幡浜',85247,CAST ('2001-8-21' as date));
insert into cities (id,name,population,date_mod) values
 ('t3825','新居浜',73239,CAST ('2001-9-14' as date));
insert into cities (id,name,population,date_mod) values
 ('t3826','西条',82418,'2001-8-26');
insert into cities (id,name,population,date_mod) values
 ('t3827','大洲',28576,'2001-1-26');
insert into cities (id,name,population,date_mod) values
 ('t3828','伊予',72431,CAST ('2001-2-4' as date));
insert into cities (id,name,population,date_mod) values
 ('t3829','西予',61958,CAST ('2001-2-19' as date));
commit;
quit;
