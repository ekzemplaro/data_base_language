CPLUS_COMMON=/var/www/data_base/common/cplus_common
json_read: json_read.cpp
	clang++ -o json_read json_read.cpp \
		$(CPLUS_COMMON)/file_io.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		-ljson11
clean:
	rm -f json_read
