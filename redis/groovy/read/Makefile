COMMON=/var/www/data_base/common
JAR=$(COMMON)/jar
export USR_SHARE=/usr/share/java
CPP_B=$(USR_SHARE)/json-lib-2.3.jar:$(USR_SHARE)/xom-1.2.1.jar:$(USR_SHARE)/commons-beanutils.jar
CPP_C=$(USR_SHARE)/commons-lang-2.4.jar:$(USR_SHARE)/ezmorph-1.0.6.jar
CPATH=.:$(CPP_B):$(CPP_C):$(JAR)/jedis-2.1.0.jar
redis_read.class: redis_read.groovy
	groovyc -cp $(CPATH) redis_read.groovy
clean:
	rm -f *.class
