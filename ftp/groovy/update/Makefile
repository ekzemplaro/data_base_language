COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
ftp_update.class: ftp_update.groovy
	groovyc -cp $(GROOVY_COMMON) ftp_update.groovy
clean:
	rm -f *.class
