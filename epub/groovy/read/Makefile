COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
JAR=$(COMMON)/jar
#
CPP=./:$(JAR)/tika-app-1.0.jar:$(GROOVY_COMMON)
#
epub_read.class: epub_read.groovy
	groovyc -cp $(CPP) epub_read.groovy
clean:
	rm -f *.class
