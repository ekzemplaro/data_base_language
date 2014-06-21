
GROOVY_COMMON=/var/www/data_base/common/groovy_common
#
CPP=./:$(GROOVY_COMMON)
mcachedb_create.class: mcachedb_create.groovy
	groovyc -cp $(CPP) mcachedb_create.groovy
clean:
	rm -f *.class
