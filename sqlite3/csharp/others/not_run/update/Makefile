COMMON=/var/www/uchida/data_base/common/csharp_common
sqlite3_update.exe :  sqlite3_update.cs
	gmcs sqlite3_update.cs \
		$(COMMON)/table_manipulate.cs \
		-r:System.Data \
		-r:Mono.Data.Sqlite
clean:
	rm -f *.exe
