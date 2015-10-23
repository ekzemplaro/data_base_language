D_COMMON=/var/www/data_base/common/D_common
json_create: json_create.d
	dmd json_create.d \
		$(D_COMMON)/text_manipulate.d \
		$(D_COMMON)/json_manipulate.d
clean:
	rm -f json_create *.o
