COMMON=/var/www/data_base/common/vb_common
text_create.exe: text_create.vb
	vbnc -out:text_create.exe $(COMMON)/text_manipulate.vb text_create.vb
	chmod +x text_create.exe
clean:
	rm -f *.exe
