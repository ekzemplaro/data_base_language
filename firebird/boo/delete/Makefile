CSHARP_COMMON=/var/www/data_base/common/csharp_common
firebird_delete.exe : firebird_delete.boo
	booc	firebird_delete.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:FirebirdSql.Data.FirebirdClient.dll
clean:
	rm -f *.exe *.mdb
