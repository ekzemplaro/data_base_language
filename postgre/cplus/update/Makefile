CPLUS_COMMON=/var/www/data_base/common/cplus_common
postgre_update: postgre_update.cpp
	g++ -o postgre_update postgre_update.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		-I/usr/include/postgresql -lpq
clean:
	rm -f postgre_update
