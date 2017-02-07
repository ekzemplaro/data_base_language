exist_read: exist_read.ml
	ocamlfind ocamlopt -o exist_read -linkpkg \
		-package str -package unix \
		-package xml-light \
		-package curl \
		text_manipulate.ml \
		xml_manipulate.ml \
		curl_manipulate.ml \
		exist_read.ml
clean:
	rm -f exist_read *.cmi *.cmo *.cmx *.o
