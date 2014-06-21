GROOVY_COMMON=/var/www/data_base/common/groovy_common
CPX=$(GROOVY_COMMON)
xml_update.class: xml_update.groovy
	groovyc -cp $(CPX) xml_update.groovy
clean:
	rm -f *.class
