COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP=$(JAR)/commons-net-3.0.1.jar:$(JAVA_COMMON)
ftp_update.class: ftp_update.java
	javac -cp $(CPP) ftp_update.java
clean:
	rm -f *.class
