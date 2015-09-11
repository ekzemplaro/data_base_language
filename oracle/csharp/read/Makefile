COMMON=/var/www/data_base/common/csharp_common
oracle_read.exe : oracle_read.cs
	mcs oracle_read.cs \
		$(COMMON)/table_manipulate.cs \
		-r:System.Data \
		-r:System.Data.OracleClient
clean:
	rm -f *.exe
