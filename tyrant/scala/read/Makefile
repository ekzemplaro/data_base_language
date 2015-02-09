COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
tyrant_read.class: tyrant_read.scala
	scalac -cp $(SCALA_COMMON) tyrant_read.scala
clean:
	rm -f *.class
