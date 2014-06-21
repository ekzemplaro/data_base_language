GROOVY_COMMON=/var/www/data_base/common/groovy_common
oracle_read.class : oracle_read.groovy
	groovyc -cp $(GROOVY_COMMON) oracle_read.groovy
clean:
	rm -f *.class
