COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
export CLASSPATH=.:$(GROOVY_COMMON)
#
xlsx_create.class : xlsx_create.groovy
	groovyc xlsx_create.groovy
clean:
	rm -f *.class
