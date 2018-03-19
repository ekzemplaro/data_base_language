COMMON=/var/www/data_base/common/csharp_common
xml_create.exe : xml_create.cs
	mcs xml_create.cs \
		$(COMMON)/xml_manipulate.cs \
		$(COMMON)/text_manipulate.cs \
		$(COMMON)/file_io.cs \
		-r:System.Data
clean:
	rm -f *.exe
