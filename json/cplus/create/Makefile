CPLUS_COMMON=/var/www/data_base/common/cplus_common
json_create.exe: json_create.cpp
	g++ -o json_create json_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		$(CPLUS_COMMON)/json_manipulate.o
clean:
	rm -f json_create
