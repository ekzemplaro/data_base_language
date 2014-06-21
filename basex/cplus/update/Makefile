CPLUS_COMMON=/var/www/data_base/common/cplus_common
basex_update.exe: basex_update.cpp
	g++ -o basex_update basex_update.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/xml_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o \
		-I/usr/include/libxml2 -lxml2 \
		-lcurl
clean:
	rm -f basex_update
