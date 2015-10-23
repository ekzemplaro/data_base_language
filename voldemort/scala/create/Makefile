export USR_SHARE=/usr/share/java
CPA=$(USR_SHARE)/json-lib-2.3.jar
COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
#
VOLDEMORT=/home/uchida/dbm/voldemort/voldemort-1.3.0
LOG4J=$(JAR)/cassandra/log4j-1.2.16.jar
CPB=$(CPA):$(LOG4J)
export CLASSPATH=./:$(VOLDEMORT)/dist/voldemort-1.3.0.jar:$(CPB):$(SCALA_COMMON)
#
voldemort_create.class: voldemort_create.scala
	scalac voldemort_create.scala
clean:
	rm -f *.class

