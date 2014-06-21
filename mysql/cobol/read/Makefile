all: cob-mysql.o mysql_read
cob-mysql.o: cob-mysql.c 
	gcc -I /usr/include/mysql -c cob-mysql.c 
mysql_read: mysql_read.cob
	cobc -x mysql_read.cob cob-mysql.o -L /usr/lib -lmysqlclient
clean:
	rm -f mysql_read *.o
