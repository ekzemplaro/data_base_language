#
COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
JAR=$(COMMON)/jar
#
CPP=./:$(GROOVY_COMMON):$(JAR)/jsonic-1.1.2.jar
mcached_update.class: mcached_update.groovy
	groovyc -cp $(CPP) mcached_update.groovy
clean:
	rm -f *.class
