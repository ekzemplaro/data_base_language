CPLUS_COMMON=/var/www/data_base/common/cplus_common
ftp_read.exe: ftp_read.cpp
	g++ -o ftp_read ftp_read.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		$(CPLUS_COMMON)/curl_manipulate.o  -lcurl
clean:
	rm -f ftp_read
