COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP=$(JAR)/commons-net-3.0.1.jar:$(JAVA_COMMON)
ftp_read.class: ftp_read.java
	javac -cp $(CPP) ftp_read.java
clean:
	rm -f *.class
