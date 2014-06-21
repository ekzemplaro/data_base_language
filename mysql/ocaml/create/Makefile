mysql_create: mysql_create.ml
	ocamlfind ocamlopt \
	-package mysql -linkpkg \
	 -o mysql_create  mysql_create.ml
clean:
	rm -f mysql_create *.cmi *.cmo *.cmx *.o
