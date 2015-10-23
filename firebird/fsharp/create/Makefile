CSHARP_COMMON=/var/www/data_base/common/csharp_common
firebird_create.exe : firebird_create.fs
	fsharpc firebird_create.fs \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:FirebirdSql.Data.FirebirdClient.dll
clean:
	rm -f *.exe
