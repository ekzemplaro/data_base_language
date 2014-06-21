basex_read: basex_read.ml
	ocamlfind ocamlopt -o basex_read -linkpkg \
		-package str -package unix \
		-package xml-light \
		-package curl \
		text_manipulate.ml \
		xml_manipulate.ml \
		curl_manipulate.ml \
		basex_read.ml
clean:
	rm -f basex_read *.cmi *.cmo *.cmx *.o
