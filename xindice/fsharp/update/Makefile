COMMON=/var/www/data_base/common/fsharp_common
xindice_update.exe: xindice_update.fs
	fsc.exe xindice_update.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
