export USR_SHARE=/usr/share/java
CPA=$(USR_SHARE)/json-lib-2.3.jar
COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
JAR=$(COMMON)/jar
#
VOLDEMORT=/home/uchida/dbm/voldemort/voldemort-1.3.0
export CLASSPATH=./:$(VOLDEMORT)/dist/voldemort-1.3.0.jar:$(CPA):$(GROOVY_COMMON)
#
voldemort_delete.class: voldemort_delete.groovy
	groovyc voldemort_delete.groovy
clean:
	rm -f *.class

