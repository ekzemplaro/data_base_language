export GROOVY_COMMON=/var/www/data_base/common/groovy_common
export USR_SHARE=/usr/share/java
export CPP_A=$(USR_SHARE)/json-lib-2.3.jar
#
CPP_B=$(CPP_A):/usr/local/lib/tokyocabinet.jar
CPP=$(CPP_B):$(GROOVY_COMMON)
tcbn_update.class: tcbn_update.groovy
	groovyc -cp $(CPP) tcbn_update.groovy
clean:
	rm -f *.class
