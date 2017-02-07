CPLUS_COMMON=/var/www/data_base/common/cplus_common
webdav_delete.exe: webdav_delete.cpp
	g++ -o webdav_delete webdav_delete.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o  -lcurl
clean:
	rm -f webdav_delete
