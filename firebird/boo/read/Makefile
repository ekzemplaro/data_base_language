CSHARP_COMMON=/var/www/data_base/common/csharp_common
firebird_read.exe : firebird_read.boo
	booc	firebird_read.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:FirebirdSql.Data.FirebirdClient.dll
clean:
	rm -f *.exe *.mdb
