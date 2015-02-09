COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP=./:$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
tyrant_delete.class: tyrant_delete.java
	javac -cp $(CPP) tyrant_delete.java -Xlint:unchecked
clean:
	rm -f *.class
