COMMON=/var/www/data_base/common
JAR=$(COMMON)/jar
CPX=$(COMMON)/groovy_common
hsqldb_read.class: hsqldb_read.groovy
	groovyc -cp $(CPX) hsqldb_read.groovy
clean:
	rm -f *.class
