D_COMMON=/var/www/data_base/common/D_common
json_update: json_update.d
	dmd json_update.d \
		$(D_COMMON)/text_manipulate.d \
		$(D_COMMON)/json_manipulate.d
clean:
	rm -f json_update *.o
