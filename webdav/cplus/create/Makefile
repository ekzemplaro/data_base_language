CPLUS_COMMON=/var/www/data_base/common/cplus_common
webdav_create.exe: webdav_create.cpp
	g++ -o webdav_create webdav_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o \
			-lcurl
clean:
	rm -f webdav_create
