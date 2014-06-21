CPLUS_COMMON=/var/www/data_base/common/cplus_common
sqlite3_create.exe: sqlite3_create.cpp
	g++ -o sqlite3_create sqlite3_create.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		-lsqlite3
clean:
	rm -f sqlite3_create
