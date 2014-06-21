COMMON=/var/www/data_base/common/csharp_common
csv_delete.exe : csv_delete.cs
	mcs csv_delete.cs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
