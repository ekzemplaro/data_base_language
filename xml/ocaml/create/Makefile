xml_create: xml_create.ml
	ocamlfind ocamlopt  \
		-package str -package unix \
		-package xml-light \
		-linkpkg \
		-o xml_create \
		text_manipulate.ml \
		xml_manipulate.ml \
		xml_create.ml
clean:
	rm -f xml_create *.cmi *.cmo *.cmx *.o
