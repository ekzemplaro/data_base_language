COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
CPATH=.:$(SCALA_COMMON):$(JAR)/jedis-2.1.0.jar
redis_read.class: redis_read.scala
	scalac -cp $(CPATH) redis_read.scala
clean:
	rm -f *.class
