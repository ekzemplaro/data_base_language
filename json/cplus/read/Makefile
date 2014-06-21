CPLUS_COMMON=/var/www/data_base/common/cplus_common
json_read: json_read.cpp
	g++ -o json_read json_read.cpp \
		$(CPLUS_COMMON)/file_io.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o
clean:
	rm -f json_read
