COMMON=/var/www/data_base/common/csharp_common
xml_delete.exe : xml_delete.cs
	mcs xml_delete.cs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
