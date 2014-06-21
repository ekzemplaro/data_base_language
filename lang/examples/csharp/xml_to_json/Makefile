COMMON=/var/www/data_base/common/csharp_common
xml_to_json.dll: xml_to_json.cs
	dmcs xml_to_json.cs \
		$(COMMON)/file_io.cs \
			-r:Newtonsoft.Json.Net20.dll \
			-r:System.Data
clean:
	rm -f ta*.dll *.json *.exe
