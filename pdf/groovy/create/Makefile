#
COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
JAR=$(COMMON)/jar
CPX=./:$(GROOVY_COMMON)/:$(JAR)/iText-5.0.5.jar
pdf_create.class :  pdf_create.groovy
	groovyc -cp $(CPX) pdf_create.groovy
clean:
	rm -f *.class *.pdf
