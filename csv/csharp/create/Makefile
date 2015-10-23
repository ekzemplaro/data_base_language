COMMON=/var/www/data_base/common/csharp_common
csv_create.exe: csv_create.cs 
	mcs csv_create.cs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
