CSHARP_COMMON=/var/www/data_base/common/csharp_common
firebird_delete.exe : firebird_delete.fs
	fsharpc firebird_delete.fs \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:FirebirdSql.Data.FirebirdClient.dll
clean:
	rm -f *.exe
