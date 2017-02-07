COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
export CLASSPATH=.:$(GROOVY_COMMON)
#
xlsx_update.class : xlsx_update.groovy
	groovyc xlsx_update.groovy
clean:
	rm -f *.class
