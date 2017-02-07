BOO_COMMON=/var/www/data_base/common/boo_common
maria_read.exe: maria_read.boo
	booc maria_read.boo \
		$(BOO_COMMON)/table_manipulate.boo \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe *.mdb
