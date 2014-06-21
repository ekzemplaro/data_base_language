COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP=./:$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
mcached_read.class: mcached_read.java
	javac -cp $(CPP) mcached_read.java -Xlint:unchecked
clean:
	rm -f *.class
