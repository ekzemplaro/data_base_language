CPLUS_COMMON=/var/www/data_base/common/cplus_common
mysql_create.exe: mysql_create.cpp
	g++ -o mysql_create mysql_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		-I /usr/include/mysql \
		-L /usr/lib -l mysqlclient
clean:
	rm -f mysql_create
