COMMON=/var/www/data_base/common/csharp_common
csv_read.exe : csv_read.cs
	mcs csv_read.cs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
