COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
JAR=$(COMMON)/jar
CPX=$(GROOVY_COMMON):$(JAR)/commons-net-3.0.1.jar
ftp_read.class: ftp_read.groovy
	groovyc -cp $(CPX) ftp_read.groovy
clean:
	rm -f *.class
