csv_update: csv_update.ml
	ocamlfind ocamlopt -package str -package unix -linkpkg -o csv_update \
		text_manipulate.ml csv_update.ml
clean:
	rm -f csv_update *.cmi *.cmo *.cmx *.o
