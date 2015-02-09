COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
ftp_read.class: ftp_read.groovy
	groovyc -cp $(GROOVY_COMMON) ftp_read.groovy
clean:
	rm -f *.class
