COMMON=/var/www/data_base/common/csharp_common
maria_delete.exe : maria_delete.cs
	mcs maria_delete.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe
