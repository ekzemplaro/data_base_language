COMMON=/var/www/data_base/common/vb_common
maria_create.exe : maria_create.vb
	vbnc -out:maria_create.exe maria_create.vb \
		$(COMMON)/text_manipulate.vb \
		/r:MySql.Data.dll
	chmod +x maria_create.exe
clean:
	rm -f *.exe
