COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
CPP=./:$(JAR)/commons-net-3.3.jar:$(SCALA_COMMON)
ftp_read.class: ftp_read.scala
	scalac -cp $(CPP) ftp_read.scala
clean:
	rm -f *.class
