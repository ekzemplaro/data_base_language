mcachedb_read: mcachedb_read.ml
	ocamlfind ocamlopt str.cmxa \
		memcache.ml \
		mcached_manipulate.ml \
		mcachedb_read.ml -o mcachedb_read \
		-linkpkg -package json-wheel
clean:
	rm -f mcachedb_read *.cmi *.cmo *.cmx *.o
