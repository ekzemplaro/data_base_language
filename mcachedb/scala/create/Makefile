COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
MEMCACHED=$(JAR)/memcached
CPPA=./:$(MEMCACHED)/java_memcached-release_2.6.3.jar:$(SCALA_COMMON)
CPP=$(CPPA):$(MEMCACHED)/slf4j-api-1.6.1.jar
mcachedb_create.class: mcachedb_create.scala
	scalac -cp $(CPP) mcachedb_create.scala -unchecked
clean:
	rm -f *.class
