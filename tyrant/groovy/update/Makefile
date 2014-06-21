#
COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
#
CPP=./:$(GROOVY_COMMON)
tyrant_update.class: tyrant_update.groovy
	groovyc -cp $(CPP) tyrant_update.groovy
clean:
	rm -f *.class
