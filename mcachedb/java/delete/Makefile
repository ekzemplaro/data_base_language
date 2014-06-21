COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
MEMCACHED_JAR=$(JAR)/memcached/java_memcached-release_2.6.3.jar
CPP=./:$(JAVA_COMMON):$(MEMCACHED_JAR)
mcachedb_delete.class: mcachedb_delete.java
	javac -cp $(CPP) mcachedb_delete.java -Xlint:unchecked
clean:
	rm -f *.class
