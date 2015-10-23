# ---------------------------------------------------------
#	maria_read.R
#
#				Nov/27/2014
#
# ---------------------------------------------------------
print ("*** 開始 ***")
library (RMySQL)
mm <- dbDriver ("MySQL")
conn <- dbConnect (mm, dbname="city",user="scott",password="tiger",host="localhost")
#
query.result <- dbSendQuery (conn, "select * from (cities)")
test.table <- fetch (query.result)
dbDisconnect (conn)
test.table
print ("*** 終了 ***")
# ---------------------------------------------------------
