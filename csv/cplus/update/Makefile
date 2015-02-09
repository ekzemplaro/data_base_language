CPLUS_COMMON=/var/www/data_base/common/cplus_common
csv_update: csv_update.cpp
	clang++ -o csv_update csv_update.cpp \
		$(CPLUS_COMMON)/text_manipulate.o
clean:
	rm -f csv_update
