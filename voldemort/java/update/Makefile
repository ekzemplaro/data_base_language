COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
JSON_JAR=$(JAR)/jsonic-1.1.2.jar
VOLDEMORT=/home/uchida/dbm/voldemort/voldemort-1.3.0
export CLASSPATH=./:$(VOLDEMORT)/dist/voldemort-1.3.0.jar:$(JSON_JAR):$(JAVA_COMMON)
#
voldemort_update.class: voldemort_update.java
	javac voldemort_update.java -Xlint:unchecked
clean:
	rm -f *.class

