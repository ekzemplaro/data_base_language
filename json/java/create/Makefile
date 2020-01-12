
COMMON=/var/www/data_base/common
JAR=$(COMMON)/jar
JAVA_COMMON=$(COMMON)/java_common
CPATH=.:$(JAVA_COMMON):$(JAR)/jackson-annotations-2.9.9.jar:$(JAR)/jackson-core-2.9.9.jar:$(JAR)/jackson-databind-2.9.9.jar
json_create.class: json_create.java
	javac -cp $(CPATH) json_create.java
clean:
	rm -f *.class
