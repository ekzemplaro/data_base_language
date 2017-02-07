JAVA_COMMON=/var/www/data_base/common/java_common
GROOVY_COMMON=/var/www/data_base/common/groovy_common
CPP_A=/usr/share/java/commons-httpclient-3.1.jar
CPP_C=$(JAVA_COMMON):$(GROOVY_COMMON)
CPX=$(CPP_A):$(CPP_C):/usr/share/java/json-lib-2.3.jar
neo4j_read.class: neo4j_read.groovy
	groovyc -cp $(CPX) neo4j_read.groovy
clean:
	rm -f *.class
