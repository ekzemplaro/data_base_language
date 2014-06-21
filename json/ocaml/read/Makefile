json_read: json_read.ml
	ocamlfind ocamlopt -o json_read -linkpkg \
		-package json-wheel \
		-package str -package unix \
		text_manipulate.ml \
		json_manipulate.ml \
		json_read.ml
clean:
	rm -f json_read *.cmi *.cmo *.cmx *.o
