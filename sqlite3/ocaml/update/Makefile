sqlite3_update: sqlite3_update.ml
	ocamlfind ocamlopt str.cmxa -package sqlite3 -linkpkg \
		-package unix -linkpkg \
		-o sqlite3_update \
		text_manipulate.ml \
		sqlite3_update.ml
clean:
	rm -f sqlite3_update *.cmi *.cmo *.cmx *.o
