COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP_B=$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
webdav_read.class: webdav_read.java
	javac -cp $(CPP_B) webdav_read.java -Xlint:unchecked
clean:
	rm -f *.class
