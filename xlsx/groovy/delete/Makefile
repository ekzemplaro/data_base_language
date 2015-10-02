COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
export CLASSPATH=.:$(GROOVY_COMMON)
#
xlsx_delete.class : xlsx_delete.groovy
	groovyc xlsx_delete.groovy
clean:
	rm -f *.class
