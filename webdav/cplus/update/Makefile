CPLUS_COMMON=/var/www/data_base/common/cplus_common
webdav_update.exe: webdav_update.cpp
	g++ -o webdav_update webdav_update.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o  -lcurl
clean:
	rm -f webdav_update
