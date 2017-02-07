CPLUS_COMMON=/var/www/data_base/common/cplus_common
berkeley_update: berkeley_update.cpp
	g++ -o berkeley_update berkeley_update.cpp \
	$(CPLUS_COMMON)/json_manipulate.o \
	$(CPLUS_COMMON)/text_manipulate.o \
	 -ldb
clean:
	rm -f berkeley_update
