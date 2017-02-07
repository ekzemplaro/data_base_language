xindice_read: xindice_read.ml
	ocamlfind ocamlopt -o xindice_read -linkpkg \
		-package str -package unix \
		-package curl \
		-package xml-light \
		text_manipulate.ml \
		xml_manipulate.ml \
		curl_manipulate.ml \
		xindice_read.ml
clean:
	rm -f xindice_read *.cmi *.cmo *.cmx *.o
