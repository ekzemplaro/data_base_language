COMMON=/var/www/data_base/common/csharp_common
json_read.exe: json_read.cs
	mcs json_read.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:DynamicJson.dll \
		-r:System.Xml.Linq.dll
clean:
	rm -f *.exe
