BOO_COMMON=/var/www/data_base/common/boo_common
mysql_delete.exe: mysql_delete.boo
	booc mysql_delete.boo \
		$(BOO_COMMON)/mysql_manipulate.boo \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe *.mdb
