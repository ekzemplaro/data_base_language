COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP=./:$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
mcached_update.class: mcached_update.java
	javac -cp $(CPP) mcached_update.java -Xlint:unchecked
clean:
	rm -f *.class
