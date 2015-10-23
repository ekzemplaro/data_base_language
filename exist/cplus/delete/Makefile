CPLUS_COMMON=/var/www/data_base/common/cplus_common
exist_delete.exe: exist_delete.cpp
	g++ -o exist_delete exist_delete.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/xml_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o \
		-I/usr/include/libxml2 -lxml2 \
		-lcurl
clean:
	rm -f exist_delete
