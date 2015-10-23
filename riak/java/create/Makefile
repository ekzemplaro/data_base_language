export COMMON=/var/www/data_base/common
export JAVA_COMMON=$(COMMON)/java_common
export JAR=$(COMMON)/jar
CPP=$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
riak_create.class :  riak_create.java
	javac -cp $(CPP) riak_create.java
clean:
	rm -f *.class
