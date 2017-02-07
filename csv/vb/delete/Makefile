COMMON=/var/www/data_base/common/vb_common
csv_delete.exe: csv_delete.vb
	vbnc -out:csv_delete.exe $(COMMON)/text_manipulate.vb csv_delete.vb
	chmod +x csv_delete.exe
clean:
	rm -f *.exe
