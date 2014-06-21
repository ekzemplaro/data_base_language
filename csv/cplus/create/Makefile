CPLUS_COMMON=/var/www/data_base/common/cplus_common
csv_create.exe: csv_create.cpp
	g++ -o csv_create csv_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o
clean:
	rm -f csv_create
