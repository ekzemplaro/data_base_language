COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP_B=$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
couch_update.class: couch_update.java
	javac -cp $(CPP_B) couch_update.java -Xlint:unchecked
clean:
	rm -f *.class
