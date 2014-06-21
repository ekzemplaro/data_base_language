CPLUS_COMMON=/var/www/data_base/common/cplus_common
berkeley_read: berkeley_read.cpp
	g++ -o berkeley_read berkeley_read.cpp \
	$(CPLUS_COMMON)/json_manipulate.o \
	$(CPLUS_COMMON)/text_manipulate.o \
	 -ldb
clean:
	rm -f berkeley_read
