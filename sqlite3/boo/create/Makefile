BOO_COMMON=/var/www/data_base/common/boo_common
sqlite3_create.exe: sqlite3_create.boo
	booc sqlite3_create.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		-r:System.Data \
		-r:Mono.Data.Sqlite
clean:
	rm -f *.exe *.mdb
