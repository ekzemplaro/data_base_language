mcachedb_create: mcachedb_create.ml
	ocamlfind ocamlopt str.cmxa \
		memcache.ml mcachedb_create.ml -o mcachedb_create \
		-linkpkg -package json-wheel
clean:
	rm -f mcachedb_create *.cmi *.cmo *.cmx *.o
