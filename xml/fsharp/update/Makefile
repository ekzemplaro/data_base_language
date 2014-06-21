CSHARP_COMMON=/var/www/data_base/common/csharp_common
xml_update.exe: xml_update.fs
	fsharpc xml_update.fs \
		-r:$(CSHARP_COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
