COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
CPATH=.:$(JAR)/jedis-2.1.0.jar:$(SCALA_COMMON)
redis_create.class: redis_create.scala
	scalac -cp $(CPATH) redis_create.scala
clean:
	rm -f *.class
