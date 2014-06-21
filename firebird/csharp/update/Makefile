CSHARP_COMMON=/var/www/data_base/common/csharp_common
firebird_update.exe : firebird_update.cs
	dmcs firebird_update.cs \
		$(CSHARP_COMMON)/fbd_manipulate.cs \
		-r:System.Data \
		-r:FirebirdSql.Data.FirebirdClient.dll
clean:
	rm -f *.exe
