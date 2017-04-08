COMMON=/var/www/data_base/common/csharp_common
maria_create.exe : maria_create.cs
	mcs maria_create.cs \
		$(COMMON)/text_manipulate.cs \
		$(COMMON)/mysql_manipulate.cs \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe
