all: text_manipulate.beam json_manipulate.beam file_io.beam
text_manipulate.beam: text_manipulate.erl
	erlc text_manipulate.erl
json_manipulate.beam: json_manipulate.erl
	erlc json_manipulate.erl
file_io.beam: file_io.erl
	erlc file_io.erl
html:
	cd html_src;make html
clean:
	rm -f *.beam
	cd html_src;make clean
