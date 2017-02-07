COMMON=/var/www/data_base/common/csharp_common
all : sqlite3_create.exe
sqlite3_create.exe :  sqlite3_create.cs
	mcs sqlite3_create.cs \
		$(COMMON)/text_manipulate.cs \
		-r:System.Data \
		-r:Mono.Data.Sqlite
clean:
	rm -f *.exe
