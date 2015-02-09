COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
CPPA=./:$(SCALA_COMMON)
mcachedb_create.class: mcachedb_create.scala
	scalac -cp $(CPPA) mcachedb_create.scala -unchecked
clean:
	rm -f *.class
