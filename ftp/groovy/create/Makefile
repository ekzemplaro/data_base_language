COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
ftp_create.class: ftp_create.groovy
	groovyc -cp $(GROOVY_COMMON) ftp_create.groovy
clean:
	rm -f *.class
