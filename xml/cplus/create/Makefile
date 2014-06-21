CPLUS_COMMON=/var/www/data_base/common/cplus_common
xml_create.exe: xml_create.cpp
	g++ -o xml_create xml_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/xml_manipulate.o \
			-I/usr/include/libxml2 -lxml2
clean:
	rm -f xml_create
