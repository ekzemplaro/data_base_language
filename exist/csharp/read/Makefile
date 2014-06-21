COMMON=/var/www/data_base/common/csharp_common
exist_read.exe: exist_read.cs
	dmcs exist_read.cs \
		-r:$(COMMON)/table_manipulate.dll \
				-r:System.Web
clean:
	rm -f *.exe
