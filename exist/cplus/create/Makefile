CPLUS_COMMON=/var/www/data_base/common/cplus_common
exist_create.exe: exist_create.cpp
	g++ -o exist_create exist_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/xml_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o \
			-I/usr/include/libxml2 -lxml2 -lcurl
clean:
	rm -f exist_create
