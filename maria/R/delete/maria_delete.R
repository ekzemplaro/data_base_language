# ---------------------------------------------------------
#	maria_delete.R
#
#				Nov/27/2014
#
# ---------------------------------------------------------
print ("*** 開始 ***")
key_in <- commandArgs(trailingOnly=TRUE)[1]

print (key_in)

library (RMySQL)
mm <- dbDriver ("MySQL")
conn <- dbConnect (mm, dbname="city",user="scott",password="tiger",host="localhost")
#
command = paste("delete from cities where ID= '",key_in,"'",sep="")
print (command)
query.result <- dbSendQuery (conn, command)
#
dbDisconnect (conn)
#
print ("*** 終了 ***")
# ---------------------------------------------------------
