COMMON=/var/www/data_base/common/fsharp_common
exist_delete.exe: exist_delete.fs
	fsc.exe exist_delete.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
