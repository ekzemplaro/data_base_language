#
COMMON=/var/www/data_base/common
CSHARP_COMMON=$(COMMON)/csharp_common
DLL=$(COMMON)/dll
dummy.exe : master_csharp_delete.aspx.cs \
		text_csharp_delete.aspx.cs \
		csv_csharp_delete.aspx.cs \
		xml_csharp_delete.aspx.cs \
		json_csharp_delete.aspx.cs \
		sqlite3_csharp_delete.aspx.cs \
		mysql_csharp_delete.aspx.cs \
		postgre_csharp_delete.aspx.cs \
		oracle_csharp_delete.aspx.cs \
		mssql_csharp_delete.aspx.cs \
		xindice_csharp_delete.aspx.cs \
		exist_csharp_delete.aspx.cs \
		couch_csharp_delete.aspx.cs \
		ftp_csharp_delete.aspx.cs \
		mcached_csharp_delete.aspx.cs \
		mcachedb_csharp_delete.aspx.cs \
		redis_csharp_delete.aspx.cs
	dmcs dummy.cs \
		master_csharp_delete.aspx.cs \
		text_csharp_delete.aspx.cs  \
		csv_csharp_delete.aspx.cs \
		xml_csharp_delete.aspx.cs \
		json_csharp_delete.aspx.cs \
		sqlite3_csharp_delete.aspx.cs \
		mysql_csharp_delete.aspx.cs \
		postgre_csharp_delete.aspx.cs \
		oracle_csharp_delete.aspx.cs \
		mssql_csharp_delete.aspx.cs \
		xindice_csharp_delete.aspx.cs \
		exist_csharp_delete.aspx.cs \
		couch_csharp_delete.aspx.cs \
		ftp_csharp_delete.aspx.cs \
		mcached_csharp_delete.aspx.cs \
		mcachedb_csharp_delete.aspx.cs \
		redis_csharp_delete.aspx.cs \
			-r:$(CSHARP_COMMON)/table_manipulate.dll \
			-r:$(CSHARP_COMMON)/lib/redis-sharp.dll \
			-r:$(DLL)/Memcached.ClientLibrary.dll \
			-r:$(DLL)/Newtonsoft.Json.dll \
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
