COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
export CLASSPATH=.:$(GROOVY_COMMON)
#
xlsx_read.class : xlsx_read.groovy
	groovyc xlsx_read.groovy
clean:
	rm -f *.class
