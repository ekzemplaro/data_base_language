text_create: text_create.ml
	ocamlfind ocamlopt -package str -package unix -linkpkg -o text_create \
		text_manipulate.ml text_create.ml
clean:
	rm -f text_create *.cmi *.cmo *.cmx *.o
