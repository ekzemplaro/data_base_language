GROOVY_COMMON=/var/www/data_base/common/groovy_common
CPP_A=/usr/share/java/commons-httpclient-3.1.jar
CPP_B=$(GROOVY_COMMON)
CPX=$(CPP_A):$(CPP_B)
xindice_delete.class: xindice_delete.groovy
	groovyc -cp $(CPX) xindice_delete.groovy
clean:
	rm -f *.class
