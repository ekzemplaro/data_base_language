COMMON=/var/www/data_base/common/csharp_common
text_update.exe : text_update.fs
	fsharpc text_update.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
