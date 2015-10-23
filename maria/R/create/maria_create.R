# ---------------------------------------------------------
#	maria_create.R
#
#				Nov/27/2014
#
# ---------------------------------------------------------
drop_table_proc<-function (conn){
	command = "drop table cities"
	print (command)
	query.result <- dbSendQuery (conn, command)
}

# ---------------------------------------------------------
create_table_proc<-function (conn){
	command = "create table cities (id varchar(10), name varchar(20), population int, date_mod date)"
	print (command)
	query.result <- dbSendQuery (conn, command)
}

# ---------------------------------------------------------
sql_insert_proc<-function (conn,id,name,population,date_mod){
	com_top = "insert into cities (id,name,population,date_mod) values ('"
	com_sec = paste (id,"','",name,"',",population,",'",date_mod,"')",sep="")
	command = paste (com_top,com_sec,sep="")
	print (command)
	query.result <- dbSendQuery (conn, command)
}

# ---------------------------------------------------------
print ("*** 開始 ***")
#
library (RMySQL)
mm <- dbDriver ("MySQL")
conn <- dbConnect (mm, dbname="city",user="scott",password="tiger",host="localhost")
#
drop_table_proc (conn)
#
create_table_proc (conn)
#
sql_insert_proc (conn,"t3321","岡山",829541,"1946-3-17")
sql_insert_proc (conn,"t3322","倉敷",541372,"1946-5-12")
sql_insert_proc (conn,"t3323","津山",487926,"1946-9-7")
sql_insert_proc (conn,"t3324","玉野",892137,"1946-2-25")
sql_insert_proc (conn,"t3325","笠岡",625489,"1946-7-8")
sql_insert_proc (conn,"t3326","井原",491635,"1946-11-12")
sql_insert_proc (conn,"t3327","総社",128674,"1946-12-21")
sql_insert_proc (conn,"t3328","高梁",639781,"1946-2-14")
sql_insert_proc (conn,"t3329","新見",492175,"1946-4-9")
#
dbDisconnect (conn)
#
print ("*** 終了 ***")
# ---------------------------------------------------------
