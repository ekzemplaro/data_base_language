csv_read: csv_read.ml
	ocamlfind ocamlopt -package str -package unix -linkpkg -o csv_read \
		text_manipulate.ml csv_read.ml
clean:
	rm -f csv_read *.cmi *.cmo *.cmx *.o
