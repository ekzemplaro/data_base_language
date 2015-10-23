COMMON=/var/www/uchida/data_base/common/csharp_common
postgre_command.exe : postgre_command.cs
	gmcs postgre_command.cs \
		$(COMMON)/table_manipulate.cs \
		-r:System.Data \
		-r:Npgsql
clean:
	rm -f *.exe
