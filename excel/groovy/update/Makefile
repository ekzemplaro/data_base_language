GROOVY_COMMON=/var/www/data_base/common/groovy_common
export CLASSPATH=.:$(GROOVY_COMMON):/usr/share/java/jxl.jar
excel_update.class : excel_update.groovy
	groovyc excel_update.groovy
clean:
	rm -f *.class
