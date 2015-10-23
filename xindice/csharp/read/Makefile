COMMON=/var/www/data_base/common/csharp_common
xindice_read.exe: xindice_read.cs
	dmcs xindice_read.cs \
		-r:$(COMMON)/table_manipulate.dll \
				-r:System.Web
clean:
	rm -f *.exe
