COMMON=/var/www/data_base/common/csharp_common
maria_create.exe : maria_create.cs
	dmcs maria_create.cs \
		-r:System.Data \
		-r:$(COMMON)/table_manipulate.dll \
		-r:MySql.Data.dll
clean:
	rm -f *.exe
