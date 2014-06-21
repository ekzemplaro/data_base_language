export USR_SHARE=/usr/share/java
CPA=$(USR_SHARE)/json-lib-2.3.jar
COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
CPP=$(CPA):$(JAR)/commons-net-3.0.1.jar:$(SCALA_COMMON)
ftp_delete.class: ftp_delete.scala
	scalac -cp $(CPP) ftp_delete.scala
clean:
	rm -f *.class
