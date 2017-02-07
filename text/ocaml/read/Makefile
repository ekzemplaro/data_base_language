text_read: text_read.ml
	ocamlfind ocamlopt -package str -package unix -linkpkg -o text_read \
		text_manipulate.ml text_read.ml
clean:
	rm -f text_read *.cmi *.cmo *.cmx *.o
