COMMON=/var/www/data_base/common/fsharp_common
exist_update.exe: exist_update.fs
	fsc.exe exist_update.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
