CSHARP_COMMON=/var/www/data_base/common/csharp_common
firebird_update.exe : firebird_update.boo
	booc	firebird_update.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:FirebirdSql.Data.FirebirdClient.dll
clean:
	rm -f *.exe
