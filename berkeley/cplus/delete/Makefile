CPLUS_COMMON=/var/www/data_base/common/cplus_common
berkeley_delete: berkeley_delete.cpp
	g++ -o berkeley_delete berkeley_delete.cpp \
	$(CPLUS_COMMON)/json_manipulate.o \
	$(CPLUS_COMMON)/text_manipulate.o \
	 -ldb
clean:
	rm -f berkeley_delete
