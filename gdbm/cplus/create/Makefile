CPLUS_COMMON=/var/www/data_base/common/cplus_common
gdbm_create: gdbm_create.cpp
	clang++ -o gdbm_create gdbm_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o \
		-std=c++11 -lgdbm
clean:
	rm -f gdbm_create
