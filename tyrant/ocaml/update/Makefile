tyrant_update: tyrant_update.ml
	ocamlfind ocamlopt str.cmxa \
		memcache.ml \
		text_manipulate.ml \
		mcached_manipulate.ml \
		tyrant_update.ml -o tyrant_update \
		-linkpkg -package json-wheel
clean:
	rm -f tyrant_update *.cmi *.cmo *.cmx *.o
