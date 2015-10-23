CPLUS_COMMON=/var/www/data_base/common/cplus_common
gdbm_delete: gdbm_delete.cpp
	clang++ -o gdbm_delete gdbm_delete.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		-std=c++11 -lgdbm
clean:
	rm -f gdbm_delete
