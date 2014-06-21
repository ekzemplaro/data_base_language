COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
MEMCACHED_JAR=$(JAR)/memcached/java_memcached-release_2.6.3.jar
export USR_SHARE=/usr/share/java
CPA=$(SCALA_COMMON):$(MEMCACHED_JAR)
mcached_read.class: mcached_read.scala
	scalac -cp $(CPA) mcached_read.scala
clean:
	rm -f *.class
