COMMON=/var/www/data_base/common/csharp_common
text_read.exe : text_read.cs
	mcs text_read.cs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
