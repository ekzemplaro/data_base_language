COMMON=/var/www/data_base/common/vb_common
text_read.exe: text_read.vb
	vbnc2 -out:text_read.exe $(COMMON)/text_manipulate.vb text_read.vb
	chmod +x text_read.exe
clean:
	rm -f *.exe
