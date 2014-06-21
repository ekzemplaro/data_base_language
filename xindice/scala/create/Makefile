COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
CPP_A=/usr/share/java/commons-httpclient-3.1.jar
CPP=$(CPP_C):$(SCALA_COMMON)
xindice_create.class :  xindice_create.scala
	scalac -cp $(CPP) xindice_create.scala
clean:
	rm -f *.class
