COMMON=/var/www/data_base/common
JAR=$(COMMON)/jar
SCALA_COMMON=$(COMMON)/scala_common
CPP_A=$(JAR)/mongo-java-driver-3.0.3.jar
CPP_B=$(CPP_A):$(SCALA_COMMON)
mongo_read.class: mongo_read.scala
	scalac -cp $(CPP_B) mongo_read.scala
clean:
	rm -f *.class
