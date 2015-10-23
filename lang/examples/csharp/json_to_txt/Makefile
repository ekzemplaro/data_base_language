COMMON=/var/www/data_base/common/csharp_common
json_to_txt.dll: json_to_txt.cs
	dmcs json_to_txt.cs \
		$(COMMON)/file_io.cs \
			-r:Newtonsoft.Json.Net20.dll \
			-r:System.Data
clean:
	rm -f *.exe ta*.dll
