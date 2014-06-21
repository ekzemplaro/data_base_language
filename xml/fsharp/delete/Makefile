CSHARP_COMMON=/var/www/data_base/common/csharp_common
xml_delete.exe: xml_delete.fs
	fsharpc xml_delete.fs \
		-r:$(CSHARP_COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
