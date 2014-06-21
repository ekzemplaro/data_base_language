CPLUS_COMMON=/var/www/data_base/common/cplus_common
postgre_create.exe: postgre_create.cpp
	g++ -o postgre_create postgre_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		-I /usr/include/postgresql \
		-lpq
clean:
	rm -f postgre_create
