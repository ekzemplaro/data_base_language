CPP_A=/usr/share/java/commons-httpclient-3.1.jar
GROOVY_COMMON=/var/www/data_base/common/groovy_common
CPX=$(CPP_A):$(GROOVY_COMMON)
xindice_read.class: xindice_read.groovy
	groovyc -cp $(CPX) --encoding UTF8 xindice_read.groovy
clean:
	rm -f *.class
