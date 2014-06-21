COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
ftp_delete.class: ftp_delete.groovy
	groovyc -cp $(GROOVY_COMMON) ftp_delete.groovy
clean:
	rm -f *.class
