COMMON=/var/www/data_base/common/csharp_common
text_delete.exe : text_delete.cs
	mcs text_delete.cs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
