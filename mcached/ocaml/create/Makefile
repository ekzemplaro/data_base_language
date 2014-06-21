mcached_create: mcached_create.ml
	ocamlfind ocamlopt str.cmxa \
		memcache.ml mcached_create.ml -o mcached_create \
		-linkpkg -package json-wheel
clean:
	rm -f mcached_create *.cmi *.cmo *.cmx *.o
