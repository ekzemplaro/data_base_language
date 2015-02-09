all: curl_manipulate.o text_manipulate.o \
	json_manipulate.o tcbn_manipulate.o file_io.o \
	xml_manipulate.o mcached_socket.o \
	redis_socket.o
curl_manipulate.o:curl_manipulate.cpp
	clang++ -c curl_manipulate.cpp
text_manipulate.o:text_manipulate.cpp
	clang++ -c text_manipulate.cpp
xml_manipulate.o:xml_manipulate.cpp
	clang++ -c xml_manipulate.cpp \
		-I/usr/include/libxml2 -lxml2
json_manipulate.o:json_manipulate.cpp
	clang++ -c json_manipulate.cpp
mcached_socket.o:mcached_socket.cpp
	clang++ -c mcached_socket.cpp
redis_socket.o:redis_socket.cpp
	clang++ -c redis_socket.cpp
tcbn_manipulate.o: tcbn_manipulate.cpp
	clang++ -c tcbn_manipulate.cpp
file_io.o:file_io.cpp
	clang++ -c file_io.cpp
html:
	cd html_src;make html
clean:
	rm -f *.o
