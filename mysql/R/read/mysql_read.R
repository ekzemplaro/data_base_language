# ---------------------------------------------------------
#	mysql_read.R
#
#				Mar/28/2012
#
# ---------------------------------------------------------
print ("*** 開始 ***")
library (RMySQL)
mm <- dbDriver ("MySQL")
conn <- dbConnect (mm, dbname="city",user="scott",password="tiger",host="host_mysql")
query.result <- dbSendQuery (conn, "SET NAMES utf8")
query.result <- dbSendQuery (conn, "select * from (cities)")
test.table <- fetch (query.result)
dbDisconnect (conn)
test.table
print ("*** 終了 ***")
# ---------------------------------------------------------
