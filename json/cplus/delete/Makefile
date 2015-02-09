CPLUS_COMMON=/var/www/data_base/common/cplus_common
json_delete: json_delete.cpp
	clang++ -o json_delete json_delete.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o
clean:
	rm -f json_delete
