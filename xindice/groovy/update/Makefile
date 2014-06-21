GROOVY_COMMON=/var/www/data_base/common/groovy_common
CPP_A=/usr/share/java/commons-httpclient-3.1.jar
CPP_B=$(CPP_A)
CPP_C=$(GROOVY_COMMON)
CPX=$(CPP_A):$(CPP_B):$(CPP_C)
xindice_update.class: xindice_update.groovy
	groovyc -cp $(CPX) xindice_update.groovy
clean:
	rm -f *.class
