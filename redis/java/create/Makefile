COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPATH=.:$(JAR)/jedis-3.2.0.jar:$(JAVA_COMMON):$(JAR)/jackson-annotations-2.9.9.jar:$(JAR)/jackson-core-2.9.9.jar:$(JAR)/jackson-databind-2.9.9.jar
redis_create.class : redis_create.java 
	javac -cp $(CPATH) redis_create.java  -Xlint:unchecked
clean:
	rm -f *.class
