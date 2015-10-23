COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP_B=$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
webdav_delete.class: webdav_delete.java
	javac -cp $(CPP_B) webdav_delete.java -Xlint:unchecked
clean:
	rm -f *.class
