exist_create: exist_create.ml
	ocamlfind ocamlopt -o exist_create -linkpkg \
		-package str -package unix \
		-package xml-light \
		-package curl \
		text_manipulate.ml \
		xml_manipulate.ml \
		curl_manipulate.ml \
		exist_create.ml
clean:
	rm -f exist_create *.cmi *.cmo *.cmx *.o
