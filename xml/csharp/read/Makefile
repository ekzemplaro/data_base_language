COMMON=/var/www/data_base/common/csharp_common
xml_read.exe : xml_read.cs
	mcs xml_read.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:System.Data
clean:
	rm -f *.exe
