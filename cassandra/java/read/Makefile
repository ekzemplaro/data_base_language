COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
CPX=./:$(JAVA_COMMON)
cassandra_read.class: cassandra_read.java
	javac -cp $(CPX) cassandra_read.java
clean:
	rm -f *.class
