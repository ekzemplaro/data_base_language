json_create: json_create.ml
	ocamlfind ocamlopt -o json_create \
		-linkpkg -package json-wheel \
		-package str \
		text_manipulate.ml \
		json_create.ml
clean:
	rm -f json_create *.cmi *.cmo *.cmx *.o
