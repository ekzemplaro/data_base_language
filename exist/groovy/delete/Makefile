GROOVY_COMMON=/var/www/data_base/common/groovy_common
CPP_A=/usr/share/java/commons-httpclient-3.1.jar
CPX=$(CPP_A):$(GROOVY_COMMON)
exist_delete.class: exist_delete.groovy
	groovyc -cp $(CPX) exist_delete.groovy
clean:
	rm -f *.class
