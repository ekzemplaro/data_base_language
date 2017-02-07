JAVA_COMMON=/var/www/data_base/common/java_common
CPP_A=/usr/local/lib/tokyocabinet.jar
CPP=$(CPP_A):$(JAVA_COMMON)
tcbn_create.class: tcbn_create.groovy
	groovyc -cp $(CPP) tcbn_create.groovy
clean:
	rm -f *.class
