COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
CPA=$(SCALA_COMMON)
mcachedb_delete.class: mcachedb_delete.scala
	scalac -cp $(CPA) mcachedb_delete.scala
clean:
	rm -f *.class
