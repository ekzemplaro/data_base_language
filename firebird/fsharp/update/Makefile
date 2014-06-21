CSHARP_COMMON=/var/www/data_base/common/csharp_common
firebird_update.exe : firebird_update.fs
	fsharpc firebird_update.fs \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:FirebirdSql.Data.FirebirdClient.dll
clean:
	rm -f *.exe
