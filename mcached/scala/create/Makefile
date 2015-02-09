COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
CPPA=./:$(SCALA_COMMON)
mcached_create.class: mcached_create.scala
	scalac -cp $(CPPA) mcached_create.scala -unchecked
clean:
	rm -f *.class
