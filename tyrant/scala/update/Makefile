COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
CPP=$(SCALA_COMMON)
tyrant_update.class: tyrant_update.scala
	scalac -cp $(CPP) tyrant_update.scala -unchecked
clean:
	rm -f *.class
