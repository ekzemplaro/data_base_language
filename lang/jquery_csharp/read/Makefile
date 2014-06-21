#
COMMON=/var/www/data_base/common
CSHARP_COMMON=$(COMMON)/csharp_common
DLL=$(COMMON)/dll
dummy.exe : text_csharp_read.aspx.cs \
		xml_csharp_read.aspx.cs \
		json_csharp_read.aspx.cs \
		sqlite3_csharp_read.aspx.cs \
		mysql_csharp_read.aspx.cs \
		postgre_csharp_read.aspx.cs \
		oracle_csharp_read.aspx.cs \
		mssql_csharp_read.aspx.cs \
		xindice_csharp_read.aspx.cs \
		exist_csharp_read.aspx.cs \
		couch_csharp_read.aspx.cs \
		ftp_csharp_read.aspx.cs \
		mcached_csharp_read.aspx.cs \
		mcachedb_csharp_read.aspx.cs \
		redis_csharp_read.aspx.cs
	dmcs dummy.cs \
		text_csharp_read.aspx.cs  \
		xml_csharp_read.aspx.cs \
		json_csharp_read.aspx.cs \
		sqlite3_csharp_read.aspx.cs \
		mysql_csharp_read.aspx.cs \
		postgre_csharp_read.aspx.cs \
		oracle_csharp_read.aspx.cs \
		mssql_csharp_read.aspx.cs \
		xindice_csharp_read.aspx.cs \
		exist_csharp_read.aspx.cs \
		couch_csharp_read.aspx.cs \
		ftp_csharp_read.aspx.cs \
		mcached_csharp_read.aspx.cs \
		mcachedb_csharp_read.aspx.cs \
		redis_csharp_read.aspx.cs \
			-r:$(CSHARP_COMMON)/lib/redis-sharp.dll \
			-r:$(CSHARP_COMMON)/table_manipulate.dll \
			-r:$(DLL)/Memcached.ClientLibrary.dll \
			-r:$(DLL)/Newtonsoft.Json.Net20.dll \
		-r:System.Data -r:System.Web \
		-r:Mono.Data.Sqlite \
		-r:$(DLL)/MySql.Data.dll \
		-r:Npgsql \
		-r:System.Data.OracleClient
clean:
	rm -f *.exe
