tyrant_create: tyrant_create.ml
	ocamlfind ocamlopt str.cmxa \
		memcache.ml tyrant_create.ml -o tyrant_create \
		-linkpkg -package json-wheel
clean:
	rm -f tyrant_create *.cmi *.cmo *.cmx *.o
