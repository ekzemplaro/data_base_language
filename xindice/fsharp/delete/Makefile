COMMON=/var/www/data_base/common/fsharp_common
xindice_delete.exe: xindice_delete.fs
	fsc.exe xindice_delete.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
