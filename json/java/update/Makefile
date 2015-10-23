COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPATH=.:$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
json_update.class: json_update.java
	javac -cp $(CPATH) json_update.java -Xlint:unchecked
clean:
	rm -f *.class
