CPLUS_COMMON=/var/www/data_base/common/cplus_common
couch_create.exe: couch_create.cpp
	clang++ -o couch_create couch_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o \
			-lcurl
clean:
	rm -f couch_create
