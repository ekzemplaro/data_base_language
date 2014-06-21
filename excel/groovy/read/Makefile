GROOVY_COMMON=/var/www/data_base/common/groovy_common
export CLASSPATH=.:$(GROOVY_COMMON):/usr/share/java/jxl.jar
excel_read.class : excel_read.groovy
	groovyc excel_read.groovy
clean:
	rm -f *.class
