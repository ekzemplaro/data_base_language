CSHARP_COMMON=/var/www/data_base/common/csharp_common
firebird_delete.exe : firebird_delete.cs
	dmcs firebird_delete.cs \
		$(CSHARP_COMMON)/fbd_manipulate.cs \
		-r:System.Data \
		-r:FirebirdSql.Data.FirebirdClient.dll
clean:
	rm -f *.exe
