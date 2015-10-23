COMMON=/var/www/data_base/common/csharp_common
xml_create.dll: xml_create.cs
	mcs xml_create.cs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe *.xml
