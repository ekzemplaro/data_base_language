#
COMMON=/var/www/data_base/common
CSHARP_COMMON=$(COMMON)/csharp_common
DLL=$(COMMON)/dll
dummy.exe : text_csharp_create.aspx.cs \
		xml_csharp_create.aspx.cs \
		json_csharp_create.aspx.cs \
		sqlite3_csharp_create.aspx.cs \
		mysql_csharp_create.aspx.cs \
		postgre_csharp_create.aspx.cs \
		oracle_csharp_create.aspx.cs \
		mssql_csharp_create.aspx.cs \
		exist_csharp_create.aspx.cs \
		couch_csharp_create.aspx.cs \
		ftp_csharp_create.aspx.cs \
		mcached_csharp_create.aspx.cs \
		mcachedb_csharp_create.aspx.cs \
		redis_csharp_create.aspx.cs
	dmcs dummy.cs \
		text_csharp_create.aspx.cs  \
		xml_csharp_create.aspx.cs \
		json_csharp_create.aspx.cs \
		sqlite3_csharp_create.aspx.cs \
		mysql_csharp_create.aspx.cs \
		postgre_csharp_create.aspx.cs \
		oracle_csharp_create.aspx.cs \
		mssql_csharp_create.aspx.cs \
		exist_csharp_create.aspx.cs \
		couch_csharp_create.aspx.cs \
		ftp_csharp_create.aspx.cs \
		mcached_csharp_create.aspx.cs \
		mcachedb_csharp_create.aspx.cs \
		redis_csharp_create.aspx.cs \
			-r:$(CSHARP_COMMON)/lib/redis-sharp.dll \
			-r:$(CSHARP_COMMON)/table_manipulate.dll \
			-r:$(DLL)/Memcached.ClientLibrary.dll \
			-r:$(DLL)/Newtonsoft.Json.dll \
			-r:$(DLL)/MySql.Data.dll \
		-r:System.Data \
		-r:System.Web \
		-r:Mono.Data.Sqlite \
		-r:Npgsql \
		-r:System.Data.OracleClient
clean:
	rm -f *.exe
