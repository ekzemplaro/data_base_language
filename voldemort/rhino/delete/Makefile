COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
JSON_JAR=$(JAR)/jsonic-1.1.2.jar
VOLDEMORT=/home/uchida/dbm/voldemort/voldemort-0.90
export CLASSPATH=./:$(VOLDEMORT)/dist/voldemort-0.90.jar:$(JSON_JAR):$(JAVA_COMMON)
#
voldemort_delete.class: voldemort_delete.java
	javac voldemort_delete.java -Xlint:unchecked
clean:
	rm -f *.class

