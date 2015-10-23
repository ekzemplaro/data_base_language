COMMON=/var/www/data_base/common
JAR=$(COMMON)/jar
CPATH=.:$(JAR)/jedis-2.1.0.jar
redis_delete.class: redis_delete.groovy
	groovyc -cp $(CPATH) redis_delete.groovy
clean:
	rm -f *.class
