#
COMMON=/var/www/data_base/common
CSHARP_COMMON=$(COMMON)/csharp_common
DLL=$(COMMON)/dll
dummy.exe : master_csharp_update.aspx.cs \
		text_csharp_update.aspx.cs \
		csv_csharp_update.aspx.cs \
		xml_csharp_update.aspx.cs \
		json_csharp_update.aspx.cs \
		sqlite3_csharp_update.aspx.cs \
		mysql_csharp_update.aspx.cs \
		postgre_csharp_update.aspx.cs \
		oracle_csharp_update.aspx.cs \
		mssql_csharp_update.aspx.cs \
		xindice_csharp_update.aspx.cs \
		exist_csharp_update.aspx.cs \
		couch_csharp_update.aspx.cs \
		ftp_csharp_update.aspx.cs \
		mcached_csharp_update.aspx.cs \
		mcachedb_csharp_update.aspx.cs \
		redis_csharp_update.aspx.cs
	dmcs dummy.cs \
		master_csharp_update.aspx.cs \
		text_csharp_update.aspx.cs  \
		csv_csharp_update.aspx.cs \
		xml_csharp_update.aspx.cs \
		json_csharp_update.aspx.cs \
		sqlite3_csharp_update.aspx.cs \
		mysql_csharp_update.aspx.cs \
		postgre_csharp_update.aspx.cs \
		oracle_csharp_update.aspx.cs \
		mssql_csharp_update.aspx.cs \
		xindice_csharp_update.aspx.cs \
		exist_csharp_update.aspx.cs \
		couch_csharp_update.aspx.cs \
		ftp_csharp_update.aspx.cs \
		mcached_csharp_update.aspx.cs \
		mcachedb_csharp_update.aspx.cs \
		redis_csharp_update.aspx.cs \
			-r:$(CSHARP_COMMON)/table_manipulate.dll \
			-r:$(CSHARP_COMMON)/lib/redis-sharp.dll \
			-r:$(DLL)/Memcached.ClientLibrary.dll \
			-r:$(DLL)/Newtonsoft.Json.Net20.dll \
			-r:$(DLL)/MySql.Data.dll \
		-r:System.Data -r:System.Web \
		-r:Mono.Data.Sqlite \
		-r:Npgsql \
		-r:System.Data.OracleClient
html:
	cd html_src; make html
clean:
	rm -f *.exe
	cd html_src; make clean
