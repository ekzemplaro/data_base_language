COMMON=/var/www/data_base/common/csharp_common
all : sqlite3_read.exe
sqlite3_read.exe :  sqlite3_read.cs
	gmcs sqlite3_read.cs \
		$(COMMON)/table_manipulate.cs \
		-r:System.Data \
		-r:Mono.Data.Sqlite
clean:
	rm -f *.exe
