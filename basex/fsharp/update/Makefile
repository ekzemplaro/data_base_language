COMMON=/var/www/data_base/common/csharp_common
xindice_update.exe: xindice_update.cs
	gmcs xindice_update.cs \
		-r:$(COMMON)/table_manipulate.dll \
				-r:System.Web
clean:
	rm -f *.exe
