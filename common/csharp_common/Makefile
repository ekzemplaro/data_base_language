table_manipulate.dll: table_manipulate.cs \
		text_manipulate.cs \
		xml_manipulate.cs \
		json_manipulate.cs \
		oracle_manipulate.cs \
		mysql_manipulate.cs \
		postgre_manipulate.cs \
		fbd_manipulate.cs \
		mssql_manipulate.cs \
		kvalue_manipulate.cs \
		mcache_manipulate.cs \
		redis_manipulate.cs \
		mongo_manipulate.cs \
		neo4j_manipulate.cs \
		get_uri.cs \
		ftp_manipulate.cs \
		cgi_manipulate.cs \
		xlsx_manipulate.cs \
		file_io.cs
	mcs /out:table_manipulate.dll /t:library \
		table_manipulate.cs \
		text_manipulate.cs \
		xml_manipulate.cs \
		json_manipulate.cs \
		oracle_manipulate.cs \
		mysql_manipulate.cs \
		postgre_manipulate.cs \
		fbd_manipulate.cs \
		mssql_manipulate.cs \
		kvalue_manipulate.cs \
		mcache_manipulate.cs \
		redis_manipulate.cs \
		mongo_manipulate.cs \
		neo4j_manipulate.cs \
		get_uri.cs \
		ftp_manipulate.cs \
		cgi_manipulate.cs \
		xlsx_manipulate.cs \
		file_io.cs \
			-r:lib/redis-sharp.dll \
			-r:../dll/Memcached.ClientLibrary.dll \
			-r:../dll/Newtonsoft.Json.dll \
			-r:../dll/MySql.Data.dll \
			-r:../dll/FirebirdSql.Data.FirebirdClient.dll \
			-r:../dll/MongoDB.dll \
			-r:../dll/EPPlus.dll \
			-r:System.Data \
			-r:System.Web \
			-r:System.Data.OracleClient \
			-r:/usr/lib/mono/2.0/Npgsql.dll
html:
	cd html_src;make html
clean:
	rm -f ta*.dll
