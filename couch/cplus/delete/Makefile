CPLUS_COMMON=/var/www/data_base/common/cplus_common
couch_delete.exe: couch_delete.cpp
	g++ -o couch_delete couch_delete.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o  -lcurl
clean:
	rm -f couch_delete
