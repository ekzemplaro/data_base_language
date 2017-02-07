COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
CPX=./:$(JAVA_COMMON)
cassandra_delete.class: cassandra_delete.java
	javac -cp $(CPX) cassandra_delete.java
clean:
	rm -f *.class
