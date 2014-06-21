ftp_read: ftp_read.ml
	ocamlfind ocamlopt -o ftp_read -linkpkg \
		-package json-wheel \
		-package curl \
		-package str \
		text_manipulate.ml \
		json_manipulate.ml \
		curl_manipulate.ml \
		ftp_read.ml
clean:
	rm -f ftp_read *.cmi *.cmo *.cmx *.o
