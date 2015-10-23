COMMON=/var/www/data_base/common/csharp_common
csv_read.exe : csv_read.fs
	fsharpc csv_read.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
