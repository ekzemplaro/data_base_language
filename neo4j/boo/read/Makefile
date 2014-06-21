CSHARP_COMMON=/var/www/data_base/common/csharp_common
neo4j_read.exe: neo4j_read.boo
	booc neo4j_read.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe *.mdb
