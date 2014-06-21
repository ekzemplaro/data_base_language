webdav_read: webdav_read.ml
	ocamlfind ocamlopt -o webdav_read -linkpkg \
		-package json-wheel \
		-package curl \
		-package str \
		text_manipulate.ml \
		json_manipulate.ml \
		curl_manipulate.ml \
		webdav_read.ml
clean:
	rm -f webdav_read *.cmi *.cmo *.cmx *.o
