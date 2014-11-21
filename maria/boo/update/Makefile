BOO_COMMON=/var/www/data_base/common/boo_common
maria_update.exe: maria_update.boo
	booc maria_update.boo \
		$(BOO_COMMON)/mysql_manipulate.boo \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe *.mdb
