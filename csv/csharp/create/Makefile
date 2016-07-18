COMMON=/var/www/data_base/common/csharp_common
csv_create.exe: csv_create.cs 
	mcs csv_create.cs \
		$(COMMON)/text_manipulate.cs
clean:
	rm -f *.exe
