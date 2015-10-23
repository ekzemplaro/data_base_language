COMMON=/var/www/data_base/common/csharp_common
xindice_delete.exe: xindice_delete.cs
	gmcs xindice_delete.cs \
		-r:$(COMMON)/table_manipulate.dll \
				-r:System.Web
clean:
	rm -f *.exe
