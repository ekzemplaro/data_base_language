CPLUS_COMMON=/var/www/data_base/common/cplus_common
xindice_read.exe: xindice_read.cpp
	g++ -o xindice_read xindice_read.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/xml_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o \
		-I/usr/include/libxml2 -lxml2 \
		-lcurl
clean:
	rm -f xindice_read
