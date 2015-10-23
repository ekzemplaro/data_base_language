COMMON=/var/www/data_base/common
JAR=$(COMMON)/jar
JAVA_COMMON=$(COMMON)/java_common
LIB_CASSANDRA=$(JAR)/cassandra
CPP_I=$(LIB_CASSANDRA)/apache-cassandra-0.8.1.jar
CPP_J=$(CPP_I):$(LIB_CASSANDRA)/libthrift-0.6.jar
CPP_K=$(CPP_J):$(LIB_CASSANDRA)/log4j-1.2.16.jar:$(LIB_CASSANDRA)/slf4j-api-1.6.1.jar:$(LIB_CASSANDRA)/slf4j-log4j12-1.6.1.jar:$(JAVA_COMMON)
#
cassandra_manipulate.class: cassandra_manipulate.java
	javac -cp $(CPP_K) cassandra_manipulate.java
clean:
	rm -f *.class
