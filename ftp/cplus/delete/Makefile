CPLUS_COMMON=/var/www/data_base/common/cplus_common
ftp_delete.exe: ftp_delete.cpp
	g++ -o ftp_delete ftp_delete.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o  -lcurl
clean:
	rm -f ftp_delete
