#
COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
#
CPP=./:$(GROOVY_COMMON)
tyrant_create.class: tyrant_create.groovy
	groovyc -cp $(CPP) tyrant_create.groovy
clean:
	rm -f *.class
