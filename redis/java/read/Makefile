COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPATH=.:$(JAR)/jedis-2.1.0.jar:$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
redis_read.class : redis_read.java 
	javac -cp $(CPATH) redis_read.java  -Xlint:unchecked
clean:
	rm -f *.class
