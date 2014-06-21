CPLUS_COMMON=/var/www/data_base/common/cplus_common
sqlite3_update: sqlite3_update.cpp
	g++ -o sqlite3_update sqlite3_update.cpp \
		$(CPLUS_COMMON)/text_manipulate.o \
		-lsqlite3
clean:
	rm -f sqlite3_update
