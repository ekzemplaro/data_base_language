COMMON=/var/www/data_base/common
CSHARP_COMMON=$(COMMON)/csharp_common
DLL=$(COMMON)/dll
json_create.exe: json_create.cs 
	mcs json_create.cs \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:Newtonsoft.Json.dll \
		-r:$(DLL)/nunit.framework.dll
clean:
	rm -f *.exe
