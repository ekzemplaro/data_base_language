COMMON=/var/www/data_base/common/csharp_common
text_create.exe: text_create.cs 
	mcs text_create.cs \
		-r:$(COMMON)/table_manipulate.dll
clean:
	rm -f *.exe
