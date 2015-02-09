COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
CPA=$(SCALA_COMMON)
mcached_delete.class: mcached_delete.scala
	scalac -cp $(CPA) mcached_delete.scala
clean:
	rm -f *.class
