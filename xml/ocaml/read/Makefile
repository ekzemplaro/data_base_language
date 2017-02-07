xml_read: xml_read.ml
	ocamlfind ocamlopt \
		-package str -package unix \
	 -package xmlm -linkpkg \
	 -o xml_read  \
		text_manipulate.ml \
		xml_manipulate.ml \
		xml_read.ml
clean:
	rm -f xml_read *.cmi *.cmo *.cmx *.o
