COMMON=/var/www/data_base/common/csharp_common
exist_update.exe: exist_update.cs
	dmcs exist_update.cs \
		-r:$(COMMON)/table_manipulate.dll \
				-r:System.Web
clean:
	rm -f *.exe
