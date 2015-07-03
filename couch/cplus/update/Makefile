CPLUS_COMMON=/var/www/data_base/common/cplus_common
couch_update.exe: couch_update.cpp
	clang++ -o couch_update couch_update.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o  -lcurl
clean:
	rm -f couch_update
