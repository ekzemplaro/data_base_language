COMMON=/var/www/data_base/common/fsharp_common
xindice_create.exe: xindice_create.fs
	fsc.exe xindice_create.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
