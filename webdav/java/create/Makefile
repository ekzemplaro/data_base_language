COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP=$(JAR)/commons-net-3.0.1.jar:$(JAVA_COMMON)
webdav_create.class: webdav_create.java
	javac -cp $(CPP) webdav_create.java
clean:
	rm -f *.class
