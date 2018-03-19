COMMON=/var/www/data_base/common/csharp_common
xml_read.exe : xml_read.cs
	mcs xml_read.cs \
		$(COMMON)/xml_manipulate.cs \
		$(COMMON)/text_manipulate.cs \
		$(COMMON)/file_io.cs \
		-r:System.Data
clean:
	rm -f *.exe
