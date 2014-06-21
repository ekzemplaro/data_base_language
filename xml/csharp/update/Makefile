COMMON=/var/www/data_base/common/csharp_common
xml_update.exe : xml_update.cs
	mcs xml_update.cs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
