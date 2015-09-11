COMMON=/var/www/data_base/common/vb_common
sqlite3_create.exe : sqlite3_create.vb
	vbnc sqlite3_create.vb \
		$(COMMON)/text_manipulate.vb \
		-r:Mono.Data.Sqlite.dll
	chmod +x sqlite3_create.exe
clean:
	rm -f *.exe
