GROOVY_COMMON=/var/www/data_base/common/groovy_common
export CLASSPATH=.:$(GROOVY_COMMON):/usr/share/java/jxl.jar
excel_create.class : excel_create.groovy
	groovyc excel_create.groovy
clean:
	rm -f *.class
