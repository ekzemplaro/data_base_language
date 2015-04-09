COMMON=/var/www/data_base/common/vb_common
csv_update.exe: csv_update.vb
	vbnc2 -out:csv_update.exe $(COMMON)/text_manipulate.vb csv_update.vb
	chmod +x csv_update.exe
clean:
	rm -f *.exe
