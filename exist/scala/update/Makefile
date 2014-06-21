COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
CPP_A=/usr/share/java/commons-httpclient-3.1.jar
CPP=$(CPP_C):$(SCALA_COMMON)
exist_update.class :  exist_update.scala
	scalac -cp $(CPP) exist_update.scala
clean:
	rm -f *.class
