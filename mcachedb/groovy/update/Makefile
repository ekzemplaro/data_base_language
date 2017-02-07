JAVA_COMMON=/var/www/data_base/common/java_common
GROOVY_COMMON=/var/www/data_base/common/groovy_common
CPP=./:$(GROOVY_COMMON)
mcachedb_update.class: mcachedb_update.groovy
	groovyc -cp $(CPP) mcachedb_update.groovy
clean:
	rm -f *.class
