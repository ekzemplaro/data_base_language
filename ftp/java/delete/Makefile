COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP=$(JAR)/commons-net-3.0.1.jar:$(JAVA_COMMON)
ftp_delete.class: ftp_delete.java
	javac -cp $(CPP) ftp_delete.java
clean:
	rm -f *.class
