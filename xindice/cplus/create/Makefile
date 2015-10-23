CPLUS_COMMON=/var/www/data_base/common/cplus_common
xindice_create.exe: xindice_create.cpp
	g++ -o xindice_create xindice_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/xml_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o \
			-I/usr/include/libxml2 -lxml2 -lcurl
clean:
	rm -f xindice_create
