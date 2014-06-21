CPLUS_COMMON=/var/www/data_base/common/cplus_common
mysql_delete: mysql_delete.cpp
	g++ -o mysql_delete mysql_delete.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		-I /usr/include/mysql \
		-L /usr/lib -l mysqlclient
clean:
	rm -f mysql_delete
