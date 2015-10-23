COMMON=/var/www/data_base/common/csharp_common
neo4j_read.exe: neo4j_read.cs
	dmcs neo4j_read.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
