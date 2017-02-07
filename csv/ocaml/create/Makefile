csv_create: csv_create.ml
	ocamlfind ocamlopt -package str -package unix -linkpkg -o csv_create \
		text_manipulate.ml csv_create.ml
clean:
	rm -f csv_create *.cmi *.cmo *.cmx *.o
