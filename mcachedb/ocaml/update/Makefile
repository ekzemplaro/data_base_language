mcachedb_update: mcachedb_update.ml
	ocamlfind ocamlopt str.cmxa \
		memcache.ml \
		text_manipulate.ml \
		mcached_manipulate.ml \
		mcachedb_update.ml -o mcachedb_update \
		-linkpkg -package json-wheel
clean:
	rm -f mcachedb_update *.cmi *.cmo *.cmx *.o
