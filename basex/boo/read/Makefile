COMMON=/var/www/data_base/common/csharp_common
basex_read.exe: basex_read.boo
	booc basex_read.boo \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe *.mdb
