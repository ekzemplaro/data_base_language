COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
JSON4S=$(COMMON)/jar/json4s
CPX=./:$(JSON4S)/json4s-core_2.11-3.2.11.jar:$(JSON4S)/json4s-native_2.11-3.2.11.jar:$(JSON4S)/json4s-ast_2.11-3.2.11.jar:$(SCALA_COMMON):$(JAR)/jedis-2.1.0.jar
redis_create.class: redis_create.scala
	scalac -cp $(CPX) redis_create.scala
clean:
	rm -f *.class
