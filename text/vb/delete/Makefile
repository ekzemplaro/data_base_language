COMMON=/var/www/data_base/common/vb_common
text_delete.exe: text_delete.vb
	vbnc2 -out:text_delete.exe $(COMMON)/text_manipulate.vb text_delete.vb
	chmod +x text_delete.exe
clean:
	rm -f *.exe
