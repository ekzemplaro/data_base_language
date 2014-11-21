CPLUS_COMMON=/var/www/data_base/common/cplus_common
maria_update: maria_update.cpp
	g++ -o maria_update maria_update.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		-I /usr/include/mysql \
		-L /usr/lib -l mysqlclient
clean:
	rm -f maria_update
