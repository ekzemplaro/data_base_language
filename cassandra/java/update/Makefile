COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
CPX=./:$(JAVA_COMMON)
cassandra_update.class: cassandra_update.java
	javac -cp $(CPX) cassandra_update.java
clean:
	rm -f *.class
