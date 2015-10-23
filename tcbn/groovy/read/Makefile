export GROOVY_COMMON=/var/www/data_base/common/groovy_common
export USR_SHARE=/usr/share/java
export CPP_A=$(USR_SHARE)/json-lib-2.3.jar
#
CPP_B=$(CPP_A):/usr/local/lib/tokyocabinet.jar
CPP=$(CPP_B):$(GROOVY_COMMON)
tcbn_read.class: tcbn_read.groovy
	groovyc -cp $(CPP) tcbn_read.groovy
clean:
	rm -f *.class
