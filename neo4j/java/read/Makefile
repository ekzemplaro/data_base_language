COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP_A=/usr/share/java/commons-httpclient-3.1.jar
CPP_B=$(CPP_A):$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
neo4j_read.class: neo4j_read.java
	javac -cp $(CPP_B) neo4j_read.java -Xlint:unchecked
clean:
	rm -f *.class
