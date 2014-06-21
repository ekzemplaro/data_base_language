SCALA_COMMON=/var/www/data_base/common/scala_common
MEMCACHED_JAR=/home/uchida/dbm/memcached/java/java_memcached/java_memcached-release_2.5.1.jar
CPP=./:$(MEMCACHED_JAR):$(SCALA_COMMON)
mcachedb_update.class: mcachedb_update.scala
	scalac -cp $(CPP) mcachedb_update.scala -unchecked
clean:
	rm -f *.class
