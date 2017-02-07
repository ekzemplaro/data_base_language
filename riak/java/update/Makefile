COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP_B=$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
riak_update.class: riak_update.java
	javac -cp $(CPP_B) riak_update.java -Xlint:unchecked
clean:
	rm -f *.class
