COMMON=/var/www/data_base/common/csharp_common
text_create.exe : text_create.fs
	fsharpc text_create.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
