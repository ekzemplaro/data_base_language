GROOVY_COMMON=/var/www/data_base/common/groovy_common
couch_read.class: couch_read.groovy
	groovyc -cp $(GROOVY_COMMON) --encoding UTF-8  couch_read.groovy
clean:
	rm -f *.class
