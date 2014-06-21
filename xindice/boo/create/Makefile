BOO_COMMON=/var/www/data_base/common/boo_common
CSHARP_COMMON=/var/www/data_base/common/csharp_common
xindice_create.exe: xindice_create.boo
	booc xindice_create.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		$(BOO_COMMON)/xml_manipulate.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
				-r:System.Web
clean:
	rm -f *.exe
