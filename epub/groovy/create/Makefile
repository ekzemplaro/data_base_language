COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
JAR=$(COMMON)/jar
CPATH=.:$(GROOVY_COMMON):$(JAR)/epubgen-0.5.0.jar
epub_create.class: epub_create.groovy
	groovyc -cp $(CPATH) epub_create.groovy
clean:
	rm -f *.class
