COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
JAR=$(COMMON)/jar
CP=./:$(GROOVY_COMMON):$(JAR)/sg-cdb-1.0.4.jar

cdb_read.class : cdb_read.groovy
	groovyc -cp $(CP) cdb_read.groovy
clean:
	rm -f *.class
