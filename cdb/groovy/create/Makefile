COMMON=/var/www/data_base/common
JAR=$(COMMON)/jar
GROOVY_COMMON=$(COMMON)/groovy_common
SG_CDB=/home/uchida/dbm/cdb/sg-cdb-1.0.4
CPP=./:$(GROOVY_COMMON):$(SG_CDB)/sg-cdb-1.0.4.jar

cdb_create.class : cdb_create.groovy
	groovyc -cp $(CPP) cdb_create.groovy
clean:
	rm -f *.class
