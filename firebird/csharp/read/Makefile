CSHARP_COMMON=/var/www/data_base/common/csharp_common
firebird_read.exe : firebird_read.cs
	dmcs firebird_read.cs \
		$(CSHARP_COMMON)/fbd_manipulate.cs \
		-r:System.Data \
		-r:FirebirdSql.Data.FirebirdClient.dll
clean:
	rm -f *.exe
