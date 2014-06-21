DFLAGS=-I/usr/include/d/dmd/phobos \
    -I/usr/include/d/dmd/druntime/import \
    -L-L/usr/lib64 -L-L/usr/lib32 -L--no-warn-search-mismatch \
    -L--export-dynamic -L-lphobos2 -L-lrt -L-lcurl
couch_read: couch_read.d
	dmd $(DFLAGS) couch_read.d
clean:
	rm -f couch_read *.o
