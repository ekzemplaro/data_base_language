COMMON=/var/www/data_base/common/csharp_common
csv_update.exe : csv_update.fs
	fsharpc csv_update.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
