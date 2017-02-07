CPLUS_COMMON=/var/www/data_base/common/cplus_common
json_update: json_update.cpp
	clang++ -o json_update json_update.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o
clean:
	rm -f json_update
