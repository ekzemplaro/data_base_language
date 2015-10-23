JAVA_COMMON=/var/www/data_base/common/java_common
GROOVY_COMMON=/var/www/data_base/common/groovy_common
CPP_A=/usr/share/java/commons-httpclient-3.1.jar
CPP_B=$(CPP_A):$(JAVA_COMMON):$(JAVA_COMMON)/jsonic-1.1.2.jar
CPP_C=$(JAVA_COMMON):$(GROOVY_COMMON)
CPX=$(CPP_A):$(CPP_B):$(CPP_C)
exist_read.class: exist_read.groovy
	groovyc -cp $(CPX) exist_read.groovy
clean:
	rm -f *.class
