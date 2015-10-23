COMMON=/var/www/data_base/common/csharp_common
csv_update.exe : csv_update.cs
	mcs csv_update.cs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
