COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CP=./:$(JAR)/sg-cdb-1.0.4.jar:$(JAR)/jsonic-1.1.2.jar:$(JAVA_COMMON)

cdb_update.class : cdb_update.scala
	scalac -cp $(CP) cdb_update.scala
clean:
	rm -f *.class
