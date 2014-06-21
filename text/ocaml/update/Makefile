text_update: text_update.ml
	ocamlfind ocamlopt -package str -package unix -linkpkg -o text_update \
		text_manipulate.ml text_update.ml
clean:
	rm -f text_update *.cmi *.cmo *.cmx *.o
