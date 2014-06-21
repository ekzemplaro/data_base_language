COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
MEMCACHED_JAR=$(JAR)/memcached/java_memcached-release_2.6.3.jar
CPP=./:$(JAVA_COMMON):$(MEMCACHED_JAR):$(JAR)/jsonic-1.1.2.jar
tyrant_delete.class: tyrant_delete.java
	javac -cp $(CPP) tyrant_delete.java -Xlint:unchecked
clean:
	rm -f *.class
