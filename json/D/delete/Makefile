D_COMMON=/var/www/data_base/common/D_common
json_delete: json_delete.d
	dmd json_delete.d \
		$(D_COMMON)/text_manipulate.d \
		$(D_COMMON)/json_manipulate.d
clean:
	rm -f json_delete *.o
