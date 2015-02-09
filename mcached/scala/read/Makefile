COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
CPA=./:$(SCALA_COMMON)
mcached_read.class: mcached_read.scala
	scalac -cp $(CPA) mcached_read.scala
clean:
	rm -f *.class
