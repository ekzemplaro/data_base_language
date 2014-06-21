csv_delete: csv_delete.ml
	ocamlfind ocamlopt -package str -package unix -linkpkg -o csv_delete \
		text_manipulate.ml csv_delete.ml
clean:
	rm -f csv_delete *.cmi *.cmo *.cmx *.o
