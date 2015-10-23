COMMON=/var/www/data_base/common/csharp_common
xindice_create.exe: xindice_create.cs
	dmcs xindice_create.cs \
		-r:$(COMMON)/table_manipulate.dll \
				-r:System.Web
clean:
	rm -f *.exe
