COMMON=/var/www/data_base/common/csharp_common
csv_delete.exe : csv_delete.fs
	fsharpc csv_delete.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
