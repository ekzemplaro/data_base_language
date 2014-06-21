GROOVY_COMMON=/var/www/data_base/common/groovy_common
export CLASSPATH=.:$(GROOVY_COMMON):/usr/share/java/jxl.jar
excel_delete.class : excel_delete.groovy
	groovyc excel_delete.groovy
clean:
	rm -f *.class
