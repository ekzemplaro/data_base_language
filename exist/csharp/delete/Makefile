COMMON=/var/www/data_base/common/csharp_common
exist_delete.exe: exist_delete.cs
	dmcs exist_delete.cs \
		-r:$(COMMON)/table_manipulate.dll \
				-r:System.Web
clean:
	rm -f *.exe
