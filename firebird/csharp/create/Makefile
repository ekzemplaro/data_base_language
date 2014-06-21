CSHARP_COMMON=/var/www/data_base/common/csharp_common
firebird_create.exe : firebird_create.cs
	dmcs firebird_create.cs \
		$(CSHARP_COMMON)/text_manipulate.cs \
		$(CSHARP_COMMON)/fbd_manipulate.cs \
		-r:System.Data \
		-r:FirebirdSql.Data.FirebirdClient.dll
clean:
	rm -f *.exe
