COMMON=/var/www/data_base/common/csharp_common
maria_update.exe : maria_update.vb
	vbnc -out:maria_update.exe maria_update.vb \
		-r:$(COMMON)/table_manipulate.dll \
		-r:MySql.Data.dll
	chmod +x maria_update.exe
clean:
	rm -f *.exe
