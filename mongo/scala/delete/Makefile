COMMON=/var/www/data_base/common
JAR=$(COMMON)/jar
CPP_A=$(JAR)/mongo-java-driver-3.0.3.jar
mongo_delete.class: mongo_delete.scala
	scalac -cp $(CPP_A) mongo_delete.scala
clean:
	rm -f *.class
