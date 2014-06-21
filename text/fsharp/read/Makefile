COMMON=/var/www/data_base/common/csharp_common
text_read.exe : text_read.fs
	fsharpc text_read.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
