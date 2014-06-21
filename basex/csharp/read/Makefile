COMMON=/var/www/data_base/common/csharp_common
basex_read.exe: basex_read.cs
	dmcs basex_read.cs \
		-r:$(COMMON)/table_manipulate.dll \
				-r:System.Web
clean:
	rm -f *.exe
