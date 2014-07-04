COMMON=/var/www/data_base/common/csharp_common
maria_read.exe : maria_read.cs
	mcs maria_read.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe
