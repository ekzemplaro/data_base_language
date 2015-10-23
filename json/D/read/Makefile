D_COMMON=/var/www/data_base/common/D_common
json_read: json_read.d
	dmd json_read.d \
		$(D_COMMON)/text_manipulate.d \
		$(D_COMMON)/json_manipulate.d
clean:
	rm -f json_read *.o
