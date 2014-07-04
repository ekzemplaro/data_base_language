BOO_COMMON=/var/www/data_base/common/boo_common
CSHARP_COMMON=/var/www/data_base/common/csharp_common
json_read.exe: json_read.boo
	booc json_read.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll
clean:
	rm -f *.exe *.mdb
