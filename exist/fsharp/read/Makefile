COMMON=/var/www/data_base/common/fsharp_common
exist_read.exe: exist_read.fs
	fsc.exe exist_read.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
