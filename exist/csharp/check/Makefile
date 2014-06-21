COMMON=/var/www/uchida/data_base/common/csharp_common
exist_check.exe: exist_check.cs
	csc exist_check.cs \
		$(COMMON)/table_manipulate.cs \
		-r:System.Data
clean:
	rm -f *.exe *.xml tmp*
