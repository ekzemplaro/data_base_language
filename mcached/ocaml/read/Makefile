mcached_read: mcached_read.ml
	ocamlfind ocamlopt str.cmxa \
		memcache.ml \
		mcached_manipulate.ml \
		mcached_read.ml -o mcached_read \
		-linkpkg -package json-wheel
clean:
	rm -f mcached_read *.cmi *.cmo *.cmx *.o
