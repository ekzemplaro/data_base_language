#
COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
#
CPP=./:$(GROOVY_COMMON)
mcached_create.class: mcached_create.groovy
	groovyc -cp $(CPP) mcached_create.groovy
clean:
	rm -f *.class
