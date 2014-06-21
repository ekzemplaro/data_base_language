CPLUS_COMMON=/var/www/data_base/common/cplus_common
ftp_create.exe: ftp_create.cpp
	g++ -o ftp_create ftp_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o \
			-lcurl
clean:
	rm -f ftp_create
