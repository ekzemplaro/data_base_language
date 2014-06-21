COMMON=/var/www/data_base/common/fsharp_common
exist_create.exe: exist_create.fs
	fsc.exe exist_create.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
