CPLUS_COMMON=/var/www/data_base/common/cplus_common
postgre_delete: postgre_delete.cpp
	g++ -o postgre_delete postgre_delete.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		-I/usr/include/postgresql -lpq
clean:
	rm -f postgre_delete
