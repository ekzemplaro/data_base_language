mcachedb_delete: mcachedb_delete.ml
	ocamlfind ocamlopt unix.cmxa str.cmxa \
		memcache.ml mcachedb_delete.ml -o mcachedb_delete
clean:
	rm -f mcachedb_delete *.cmi *.cmo *.cmx *.o
