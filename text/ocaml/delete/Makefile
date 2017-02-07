text_delete: text_delete.ml
	ocamlfind ocamlopt -package str -package unix -linkpkg -o text_delete \
		text_manipulate.ml text_delete.ml
clean:
	rm -f text_delete *.cmi *.cmo *.cmx *.o
