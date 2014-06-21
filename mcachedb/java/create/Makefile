COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
MEMCACHED_JAR=$(JAR)/memcached/java_memcached-release_2.6.3.jar
CPP=./:$(JAVA_COMMON):$(MEMCACHED_JAR):$(JAR)/jsonic-1.1.2.jar
mcachedb_create.class: mcachedb_create.java
	javac -cp $(CPP) mcachedb_create.java -Xlint:unchecked
clean:
	rm -f *.class
