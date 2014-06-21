CSHARP_COMMON=/var/www/data_base/common/csharp_common
xml_delete.exe: xml_delete.boo
	booc xml_delete.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll
clean:
	rm -f *.exe *.mdb
