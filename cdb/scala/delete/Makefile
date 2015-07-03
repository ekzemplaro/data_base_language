COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CP=./:$(JAR)/sg-cdb-1.0.4.jar:$(JAR)/jsonic-1.1.2.jar:$(JAVA_COMMON)

cdb_delete.class : cdb_delete.scala
	scalac -cp $(CP) cdb_delete.scala
clean:
	rm -f *.class
