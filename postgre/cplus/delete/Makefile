CPLUS_COMMON=/var/www/data_base/common/cplus_common
postgre_delete: postgre_delete.cpp
	clang++ -o postgre_delete postgre_delete.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		-I /usr/include/postgresql/server \
		-lpq
clean:
	rm -f postgre_delete
