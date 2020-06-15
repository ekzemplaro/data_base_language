#! /usr/bin/python
#
#
#
import	mysql.connector
#
print("*** start ***")
#
host_aa='localhost'
data_base = 'city'
user_aa ='scott'
password_aa = 'tiger123'
conn = mysql.connector.connect(user=user_aa, password=password_aa, \
                              host=host_aa,database=data_base)
#
cursor = conn.cursor()
#
cursor.execute("SELECT VERSION ()")
#
row = cursor.fetchone()
print(row[0])
#
cursor.close()
conn.close()
#
print("*** end ***")
