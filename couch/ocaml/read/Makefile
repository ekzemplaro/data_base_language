couch_read: couch_read.ml
	ocamlfind ocamlopt -o couch_read -linkpkg \
		-package json-wheel \
		-package curl \
		-package str \
		text_manipulate.ml \
		json_manipulate.ml \
		curl_manipulate.ml \
		couch_read.ml
clean:
	rm -f couch_read *.cmi *.cmo *.cmx *.o
