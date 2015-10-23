# ---------------------------------------------------------
#	mysql_create.R
#
#				Feb/21/2014
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
conn <- dbConnect (mm, dbname="city",user="scott",password="tiger",host="host_mysql")
query.result <- dbSendQuery (conn, "SET NAMES utf8")
#
drop_table_proc (conn)
#
create_table_proc (conn)
#
sql_insert_proc (conn,"t3321","岡山",82541,"1946-5-17")
sql_insert_proc (conn,"t3322","倉敷",54372,"1946-8-12")
sql_insert_proc (conn,"t3323","津山",48926,"1946-2-7")
sql_insert_proc (conn,"t3324","玉野",89137,"1946-4-25")
sql_insert_proc (conn,"t3325","笠岡",62489,"1946-9-8")
sql_insert_proc (conn,"t3326","井原",49635,"1946-3-12")
sql_insert_proc (conn,"t3327","総社",12674,"1946-10-29")
sql_insert_proc (conn,"t3328","高梁",63981,"1946-2-14")
sql_insert_proc (conn,"t3329","新見",49275,"1946-9-9")
#
dbDisconnect (conn)
#
print ("*** 終了 ***")
# ---------------------------------------------------------
