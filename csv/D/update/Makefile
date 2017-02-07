D_COMMON=/var/www/data_base/common/D_common
csv_update: csv_update.d
	dmd csv_update.d $(D_COMMON)/text_manipulate.d
clean:
	rm -f csv_update *.o
