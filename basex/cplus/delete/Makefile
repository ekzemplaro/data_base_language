CPLUS_COMMON=/var/www/data_base/common/cplus_common
basex_delete.exe: basex_delete.cpp
	g++ -o basex_delete basex_delete.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/xml_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o \
		-I/usr/include/libxml2 -lxml2 \
		-lcurl
clean:
	rm -f basex_delete
