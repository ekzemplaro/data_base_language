mysql_delete: mysql_delete.ml
	ocamlfind ocamlopt \
	-package mysql -linkpkg \
	 -o mysql_delete  mysql_delete.ml
clean:
	rm -f mysql_delete *.cmi *.cmo *.cmx *.o
