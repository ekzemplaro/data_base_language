GROOVY_COMMON=/var/www/data_base/common/groovy_common
CPP_A=/usr/share/java/commons-httpclient-3.1.jar
CPX=$(CPP_A):$(GROOVY_COMMON)
xindice_create.class: xindice_create.groovy
	groovyc -cp $(CPX) xindice_create.groovy
clean:
	rm -f *.class
