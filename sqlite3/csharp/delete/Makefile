COMMON=/var/www/data_base/common/csharp_common
all : sqlite3_delete.exe
sqlite3_delete.exe :  sqlite3_delete.cs
	mcs sqlite3_delete.cs \
		$(COMMON)/table_manipulate.cs \
		-r:System.Data \
		-r:Mono.Data.Sqlite
clean:
	rm -f *.exe
