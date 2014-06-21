xindice_create: xindice_create.ml
	ocamlfind ocamlopt -o xindice_create -linkpkg \
		-package str -package unix \
		-package xml-light \
		-package curl \
		text_manipulate.ml \
		xml_manipulate.ml \
		curl_manipulate.ml \
		xindice_create.ml
clean:
	rm -f xindice_create *.cmi *.cmo *.cmx *.o
