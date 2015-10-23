COMMON=/var/www/data_base/common/csharp_common
csv_create.exe : csv_create.fs
	fsharpc csv_create.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
