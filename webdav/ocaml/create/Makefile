webdav_create: webdav_create.ml
	ocamlfind ocamlopt -o webdav_create -linkpkg \
		-package json-wheel \
		-package curl \
		-package str \
		text_manipulate.ml \
		json_manipulate.ml \
		curl_manipulate.ml \
		webdav_create.ml
clean:
	rm -f webdav_create *.cmi *.cmo *.cmx *.o
