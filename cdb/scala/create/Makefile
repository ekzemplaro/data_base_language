COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
SG_CDB=/home/uchida/dbm/cdb/sg-cdb-1.0.4
CPP=./:$(JAVA_COMMON):$(SG_CDB)/sg-cdb-1.0.4.jar:$(JAR)/jsonic-1.1.2.jar

cdb_create.class : cdb_create.scala
	scalac -cp $(CPP) cdb_create.scala
clean:
	rm -f *.class
