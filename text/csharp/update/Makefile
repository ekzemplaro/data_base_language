COMMON=/var/www/data_base/common/csharp_common
text_update.exe : text_update.cs
	mcs text_update.cs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
