#
COMMON=/var/www/uchida/data_base/common/csharp_common
check01.exe : check01.cs
	csc check01.cs \
		-r:System.Data -r:System.Web \
		-r:$(COMMON)/Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
