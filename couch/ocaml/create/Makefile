couch_create: couch_create.ml
	ocamlfind ocamlopt -o couch_create -linkpkg \
		-package json-wheel \
		-package curl \
		-package str \
		text_manipulate.ml \
		json_manipulate.ml \
		curl_manipulate.ml \
		couch_create.ml
clean:
	rm -f couch_create *.cmi *.cmo *.cmx *.o
