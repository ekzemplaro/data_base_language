COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
JAR=$(COMMON)/jar
#
CPP=./:$(JAR)/tika-app-1.0.jar:$(JAR)/epubgen-0.5.0.jar:$(GROOVY_COMMON)
#
epub_update.class: epub_update.groovy
	groovyc -cp $(CPP) epub_update.groovy
clean:
	rm -f *.class
