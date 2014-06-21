CSHARP_COMMON=/var/www/data_base/common/csharp_common
xml_read.exe: xml_read.fs
	fsharpc xml_read.fs \
		-r:$(CSHARP_COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
