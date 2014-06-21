COMMON=/var/www/data_base/common
JAR=$(COMMON)/jar
SCALA_COMMON=$(COMMON)/scala_common
CPP_A=$(JAR)/mongo-2.8.0.jar
CPP_B=$(CPP_A):$(SCALA_COMMON)
mongo_delete.class: mongo_delete.scala
	scalac -cp $(CPP_B) mongo_delete.scala -deprecation
clean:
	rm -f *.class
