COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP=./:$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
mcachedb_create.class: mcachedb_create.java
	javac -cp $(CPP) mcachedb_create.java -Xlint:unchecked
clean:
	rm -f *.class
