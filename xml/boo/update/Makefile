CSHARP_COMMON=/var/www/data_base/common/csharp_common
xml_update.exe: xml_update.boo
	booc xml_update.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll
clean:
	rm -f *.exe *.mdb
