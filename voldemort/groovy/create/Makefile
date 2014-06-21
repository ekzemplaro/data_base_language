COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
JAR=$(COMMON)/jar
#
JSON_JAR=$(JAR)/jsonic-1.1.2.jar
VOLDEMORT=/home/uchida/dbm/voldemort/voldemort-1.3.0
export CLASSPATH=./:$(VOLDEMORT)/dist/voldemort-1.3.0.jar:$(JSON_JAR):$(GROOVY_COMMON)
#
voldemort_create.class: voldemort_create.groovy
	groovyc voldemort_create.groovy
clean:
	rm -f *.class

