GROOVY_COMMON=/var/www/data_base/common/groovy_common
oracle_create.class : oracle_create.groovy
	groovyc -cp $(GROOVY_COMMON) oracle_create.groovy
clean:
	rm -f *.class
