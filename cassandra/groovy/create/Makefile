GROOVY_COMMON=/var/www/data_base/common/groovy_common
COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
JAR_CASSANDRA=$(JAR)/cassandra
CPXA=./:$(JAVA_COMMON):$(JAR_CASSANDRA)/apache-cassandra-1.0.9.jar
CPXB=$(CPXA):$(JAR_CASSANDRA)/libthrift-0.6.jar
CPX=$(CPXB):$(GROOVY_COMMON)
cassandra_create.class: cassandra_create.groovy
	groovyc -cp $(CPX) cassandra_create.groovy
clean:
	rm -f *.class
