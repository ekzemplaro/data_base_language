COMMON=/var/www/data_base/common/vb_common
text_update.exe: text_update.vb
	vbnc -out:text_update.exe $(COMMON)/text_manipulate.vb text_update.vb
	chmod +x text_update.exe
clean:
	rm -f *.exe
