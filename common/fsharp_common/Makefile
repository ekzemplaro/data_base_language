all: mcached_manipulate.dll
mcached_manipulate.dll: mcached_manipulate.fs
	fsharpc -a mcached_manipulate.fs \
		-r:log4net.dll \
		-r:Memcached.ClientLibrary.dll
html:
	cd html_src;make html
clean:
	rm -f *.exe mcached_manipulate.dll
