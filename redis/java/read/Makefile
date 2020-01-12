COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPATH=.:$(JAVA_COMMON):$(JAR)/jedis-3.2.0.jar
redis_read.class : redis_read.java 
	javac -cp $(CPATH) redis_read.java  -Xlint:unchecked
clean:
	rm -f *.class
