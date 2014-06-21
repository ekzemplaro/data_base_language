COMMON=/var/www/data_base/common/csharp_common
exist_create.exe: exist_create.cs
	dmcs exist_create.cs \
		-r:$(COMMON)/table_manipulate.dll \
				-r:System.Web
clean:
	rm -f *.exe
