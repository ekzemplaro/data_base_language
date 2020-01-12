
COMMON=/var/www/data_base/common
JAR=$(COMMON)/jar
JAVA_COMMON=$(COMMON)/java_common
CPATH=.:$(JAVA_COMMON):$(JAR)/jackson-annotations-2.9.9.jar:$(JAR)/jackson-core-2.9.9.jar:$(JAR)/jackson-databind-2.9.9.jar
json_read.class: json_read.java
	javac -cp $(CPATH) json_read.java
clean:
	rm -f *.class
