COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CP=./:$(JAVA_COMMON):$(JAR)/sg-cdb-1.0.4.jar:$(JAR)/jsonic-1.1.2.jar

cdb_read.class : cdb_read.scala
	scalac -cp $(CP) cdb_read.scala
clean:
	rm -f *.class
