COMMON=/var/www/data_base/common/csharp_common
basex_read.exe: basex_read.fs
	fsharpc basex_read.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
