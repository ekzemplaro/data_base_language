COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
CPATH=.:$(SCALA_COMMON):$(JAR)/jedis-2.1.0.jar
redis_delete.class: redis_delete.scala
	scalac -cp $(CPATH) redis_delete.scala
clean:
	rm -f *.class
