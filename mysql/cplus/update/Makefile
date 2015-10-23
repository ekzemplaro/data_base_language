CPLUS_COMMON=/var/www/data_base/common/cplus_common
mysql_update: mysql_update.cpp
	g++ -o mysql_update mysql_update.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		-I /usr/include/mysql \
		-L /usr/lib -l mysqlclient
clean:
	rm -f mysql_update
