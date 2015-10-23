COMMON=/var/www/data_base/common/fsharp_common
xindice_read.exe: xindice_read.fs
	fsc.exe xindice_read.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
