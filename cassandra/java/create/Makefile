COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
CPXA=./:$(JAVA_COMMON)
CPX=$(CPXA)
cassandra_create.class: cassandra_create.java
	javac -cp $(CPX) cassandra_create.java
clean:
	rm -f *.class
