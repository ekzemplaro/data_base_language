CPLUS_COMMON=/var/www/data_base/common/cplus_common
xml_update: xml_update.cpp
	clang++ -o xml_update  xml_update.cpp \
		$(CPLUS_COMMON)/file_io.o \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/xml_manipulate.o \
		-I/usr/include/libxml2 -lxml2
clean:
	rm -f xml_update
