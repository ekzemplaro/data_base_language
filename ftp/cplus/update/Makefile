CPLUS_COMMON=/var/www/data_base/common/cplus_common
ftp_update.exe: ftp_update.cpp
	g++ -o ftp_update ftp_update.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o  -lcurl
clean:
	rm -f ftp_update
