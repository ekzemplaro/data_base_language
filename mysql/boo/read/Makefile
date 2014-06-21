BOO_COMMON=/var/www/data_base/common/boo_common
mysql_read.exe: mysql_read.boo
	booc mysql_read.boo \
		$(BOO_COMMON)/table_manipulate.boo \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe *.mdb
