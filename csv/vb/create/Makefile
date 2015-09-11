COMMON=/var/www/data_base/common/vb_common
csv_create.exe: csv_create.vb
	vbnc -out:csv_create.exe $(COMMON)/text_manipulate.vb csv_create.vb
	chmod +x csv_create.exe
clean:
	rm -f *.exe
