COMMON=/var/www/data_base/common/csharp_common
text_read.exe : text_read.cs
	mcs text_read.cs \
		$(COMMON)/text_manipulate.cs
clean:
	rm -f *.exe
