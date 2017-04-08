COMMON=/var/www/data_base/common/csharp_common
maria_delete.exe : maria_delete.cs
	mcs maria_delete.cs \
		$(COMMON)/mysql_manipulate.cs \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe
