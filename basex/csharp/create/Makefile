COMMON=/var/www/data_base/common/csharp_common
basex_create.exe: basex_create.cs
	dmcs basex_create.cs \
		-r:$(COMMON)/table_manipulate.dll \
				-r:System.Web
clean:
	rm -f *.exe
