COMMON=/var/www/data_base/common/vb_common
mssql_create.exe :  mssql_create.vb
	vbnc -out:mssql_create.exe mssql_create.vb \
		$(COMMON)/text_manipulate.vb
	chmod +x mssql_create.exe
clean:
	rm -f *.exe
