COMMON=/var/www/data_base/common/csharp_common
text_delete.exe : text_delete.fs
	fsharpc text_delete.fs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
