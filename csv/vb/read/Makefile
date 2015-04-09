COMMON=/var/www/data_base/common/vb_common
csv_read.exe: csv_read.vb
	vbnc2 -out:csv_read.exe $(COMMON)/text_manipulate.vb csv_read.vb
	chmod +x csv_read.exe
clean:
	rm -f *.exe
