BOO_COMMON=/var/www/data_base/common/boo_common
mysql_update.exe: mysql_update.boo
	booc mysql_update.boo \
		$(BOO_COMMON)/mysql_manipulate.boo \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe *.mdb
