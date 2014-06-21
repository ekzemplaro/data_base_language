COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
POI39=$(COMMON)/jar/poi-3.9
POI_LIB=$(POI39)/poi-3.9-20121203.jar:$(POI39)/poi-ooxml-3.9-20121203.jar:$(POI39)/poi-ooxml-schemas-3.9-20121203.jar:$(POI39)/ooxml-lib/xmlbeans-2.3.0.jar
export CLASSPATH=.:$(GROOVY_COMMON):$(POI_LIB)
xlsx_update.class : xlsx_update.groovy
	groovyc xlsx_update.groovy
clean:
	rm -f *.class
