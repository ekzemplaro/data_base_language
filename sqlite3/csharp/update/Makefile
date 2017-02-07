COMMON=/var/www/data_base/common/csharp_common
all : sqlite3_update.exe
sqlite3_update.exe :  sqlite3_update.cs
	mcs sqlite3_update.cs \
		$(COMMON)/table_manipulate.cs \
		-r:System.Data \
		-r:Mono.Data.Sqlite
clean:
	rm -f *.exe
