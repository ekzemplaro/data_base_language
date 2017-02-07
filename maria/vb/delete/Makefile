COMMON=/var/www/data_base/common/csharp_common
maria_delete.exe : maria_delete.vb
	vbnc -out:maria_delete.exe maria_delete.vb \
		-r:$(COMMON)/table_manipulate.dll \
		-r:MySql.Data.dll
	chmod +x maria_delete.exe
clean:
	rm -f *.exe
