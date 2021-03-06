# ---------------------------------------------------------
#	mysql_update.R
#
#				Jul/02/2012
#
# ---------------------------------------------------------
print ("*** 開始 ***")
key_in <- commandArgs(trailingOnly=TRUE)[1]
population_in <- commandArgs(trailingOnly=TRUE)[2]

print (key_in)
print (population_in)

library (RMySQL)
mm <- dbDriver ("MySQL")
conn <- dbConnect (mm, dbname="city",user="scott",password="tiger",host="host_mysql")
query.result <- dbSendQuery (conn, "SET NAMES utf8")
#
today = Sys.Date ()
print (today)
command = paste("update cities set POPULATION = ",population_in,",DATE_MOD='",today,"' where ID= '",key_in,"'",sep="")
print (command)
query.result <- dbSendQuery (conn, command)
#
dbDisconnect (conn)
#
print ("*** 終了 ***")
# ---------------------------------------------------------
