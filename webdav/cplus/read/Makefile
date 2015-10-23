CPLUS_COMMON=/var/www/data_base/common/cplus_common
webdav_read.exe: webdav_read.cpp
	g++ -o webdav_read webdav_read.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o  -lcurl
clean:
	rm -f webdav_read
