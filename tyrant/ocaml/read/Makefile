tyrant_read: tyrant_read.ml
	ocamlfind ocamlopt str.cmxa \
		memcache.ml \
		mcached_manipulate.ml \
		tyrant_read.ml -o tyrant_read \
		-linkpkg -package json-wheel
clean:
	rm -f tyrant_read *.cmi *.cmo *.cmx *.o
