COMMON=/var/www/data_base/common/csharp_common
maria_update.exe : maria_update.cs
	mcs maria_update.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe
