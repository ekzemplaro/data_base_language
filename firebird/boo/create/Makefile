COMMON=/var/www/data_base/common
CSHARP_COMMON=$(COMMON)/csharp_common
BOO_COMMON=$(COMMON)/boo_common
firebird_create.exe : firebird_create.boo
	booc firebird_create.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:FirebirdSql.Data.FirebirdClient.dll
clean:
	rm -f *.exe *.mdb
