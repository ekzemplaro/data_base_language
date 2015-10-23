COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
CPP=./:$(SCALA_COMMON)
tyrant_create.class: tyrant_create.scala
	scalac -cp $(CPP) tyrant_create.scala -unchecked
clean:
	rm -f *.class
