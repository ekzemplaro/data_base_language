CPLUS_COMMON=/var/www/data_base/common/cplus_common
couch_read.exe: couch_read.cpp
	g++ -o couch_read couch_read.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o  -lcurl
clean:
	rm -f couch_read
