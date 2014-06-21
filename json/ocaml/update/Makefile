json_update: json_update.ml
	ocamlfind ocamlopt -o json_update \
		-linkpkg \
		-package str \
		-package json-wheel \
		text_manipulate.ml \
		json_manipulate.ml \
		json_update.ml
clean:
	rm -f json_update *.cmi *.cmo *.cmx *.o
