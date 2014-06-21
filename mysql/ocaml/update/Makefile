mysql_update: mysql_update.ml
	ocamlfind ocamlopt str.cmxa \
		-package mysql -linkpkg \
		-package unix -linkpkg \
		-o mysql_update \
		text_manipulate.ml \
		mysql_update.ml
clean:
	rm -f mysql_update *.cmi *.cmo *.cmx *.o
