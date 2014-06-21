COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
JAR=$(COMMON)/jar
#
CPP=./:$(JAR)/tika-app-1.0.jar:$(GROOVY_COMMON)
#
epub_delete.class: epub_delete.groovy
	groovyc -cp $(CPP) epub_delete.groovy
clean:
	rm -f *.class
