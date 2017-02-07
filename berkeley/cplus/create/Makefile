CPLUS_COMMON=/var/www/data_base/common/cplus_common
text_create.exe: text_create.cpp
	g++ -o text_create text_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o
clean:
	rm -f text_create
