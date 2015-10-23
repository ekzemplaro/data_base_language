connect 'jdbc:derby://localhost:1527/city_aaa';

insert into cities (id,name,population,date_mod) values
 ('t3551','山口',41856,'2001-7-2');
insert into cities (id,name,population,date_mod) values
 ('t3552','下関',37239,CAST ('2001-3-4' as date));
insert into cities (id,name,population,date_mod) values
 ('t3553','萩',26547,'2001-3-6');
insert into cities (id,name,population,date_mod) values
 ('t3554','徳山',51238,CAST ('2001-1-21' as date));
insert into cities (id,name,population,date_mod) values
 ('t3555','岩国',72634,CAST ('2001-4-11' as date));
insert into cities (id,name,population,date_mod) values
 ('t3556','光',57863,CAST ('2001-3-17' as date));
insert into cities (id,name,population,date_mod) values
 ('t3557','宇部',42951,CAST ('2001-5-12' as date));
insert into cities (id,name,population,date_mod) values
 ('t3558','長門',32784,CAST ('2001-7-28' as date));
insert into cities (id,name,population,date_mod) values
 ('t3559','防府',61952,CAST ('2001-2-14' as date));
commit;
quit;
