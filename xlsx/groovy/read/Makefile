COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
POI312=$(COMMON)/jar/poi-3.12
POI_LIB=$(POI312)/poi-3.12-20150511.jar:$(POI312)/poi-ooxml-3.12-20150511.jar:$(POI312)/poi-ooxml-schemas-3.12-20150511.jar:$(POI312)/ooxml-lib/xmlbeans-2.6.0.jar
export CLASSPATH=.:$(GROOVY_COMMON):$(POI_LIB)
xlsx_read.class : xlsx_read.groovy
	groovyc xlsx_read.groovy
clean:
	rm -f *.class
