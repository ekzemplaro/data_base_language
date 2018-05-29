CPLUS_COMMON=/var/www/data_base/common/cplus_common
json_read: json_read.cpp
	clang++ -o json_read json_read.cpp \
		$(CPLUS_COMMON)/file_io.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		-std=c++11 -fno-rtti -fno-exceptions -ljson11
clean:
	rm -f json_read
