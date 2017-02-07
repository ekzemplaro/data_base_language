CPLUS_COMMON=/var/www/data_base/common/cplus_common
tcbn_delete: tcbn_delete.cpp
	g++ -o tcbn_delete tcbn_delete.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/mcached_manipulate.o \
		$(CPLUS_COMMON)/tcbn_manipulate.o \
		-ltokyocabinet -lz -lbz2 -lpthread -lm -lc
clean:
	rm -f tcbn_delete
