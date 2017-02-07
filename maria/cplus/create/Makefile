CPLUS_COMMON=/var/www/data_base/common/cplus_common
maria_create.exe: maria_create.cpp
	clang++ -o maria_create maria_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		-I /usr/include/mysql \
		-L /usr/lib -l mysqlclient
clean:
	rm -f maria_create
