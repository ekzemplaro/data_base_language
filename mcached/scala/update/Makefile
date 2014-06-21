COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
MEMCACHED=$(JAR)/memcached
CPPA=./:$(MEMCACHED)/java_memcached-release_2.6.3.jar:$(SCALA_COMMON)
CPP=$(CPPA):$(MEMCACHED)/slf4j-api-1.6.1.jar
mcached_update.class: mcached_update.scala
	scalac -cp $(CPP) mcached_update.scala -unchecked
clean:
	rm -f *.class
