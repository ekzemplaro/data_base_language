mcached_update: mcached_update.ml
	ocamlfind ocamlopt str.cmxa \
		memcache.ml \
		text_manipulate.ml \
		mcached_manipulate.ml \
		mcached_update.ml -o mcached_update \
		-linkpkg -package json-wheel
clean:
	rm -f mcached_update *.cmi *.cmo *.cmx *.o
