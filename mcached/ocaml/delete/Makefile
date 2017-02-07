mcached_delete: mcached_delete.ml
	ocamlfind ocamlopt unix.cmxa str.cmxa \
		memcache.ml mcached_delete.ml -o mcached_delete
clean:
	rm -f mcached_delete *.cmi *.cmo *.cmx *.o
