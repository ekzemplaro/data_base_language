COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP_A=$(JAR)/mongo-java-driver-3.0.3.jar
CPP_B=$(CPP_A):$(JAVA_COMMON)
mongo_delete.class: mongo_delete.java
	javac -cp $(CPP_B) mongo_delete.java -Xlint:unchecked
clean:
	rm -f *.class
