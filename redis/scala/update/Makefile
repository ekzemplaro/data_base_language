COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
CPATH=.:$(SCALA_COMMON):$(JAR)/jedis-2.1.0.jar
redis_update.class: redis_update.scala
	scalac -cp $(CPATH) redis_update.scala
clean:
	rm -f *.class
