CPLUS_COMMON=/var/www/data_base/common/cplus_common
exist_read.exe: exist_read.cpp
	g++ -o exist_read exist_read.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/xml_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o \
		-I/usr/include/libxml2 -lxml2 \
		-lcurl
clean:
	rm -f exist_read
