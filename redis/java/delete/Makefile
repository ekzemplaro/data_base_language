COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPATH=.:$(JAR)/jedis-3.2.0.jar:$(JAVA_COMMON)
redis_delete.class : redis_delete.java 
	javac -cp $(CPATH) redis_delete.java  -Xlint:unchecked
clean:
	rm -f *.class
