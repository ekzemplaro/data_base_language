COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
CPA=$(SCALA_COMMON)
mcachedb_read.class: mcachedb_read.scala
	scalac -cp $(CPA) mcachedb_read.scala
clean:
	rm -f *.class
