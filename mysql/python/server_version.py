#! /usr/bin/python
#
#
#
import MySQLdb
#
print ("*** start ***")
#
conn = MySQLdb.connect (host="host_mysql",user="scott",passwd="tiger")
#
cursor = conn.cursor ()
cursor.execute ("SELECT VERSION ()")
#
row = cursor.fetchone ()
print row[0]
#
cursor.close ()
conn.close ()
#
print ("*** end ***")
