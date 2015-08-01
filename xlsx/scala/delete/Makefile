COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
POI312=$(COMMON)/jar/poi-3.12
export CLASSPATH=./:$(SCALA_COMMON):$(POI312)/poi-3.12-20150511.jar:$(POI312)/poi-ooxml-3.12-20150511.jar:$(POI312)/poi-ooxml-schemas-3.12-20150511.jar:$(POI312)/ooxml-lib/xmlbeans-2.6.0.jar
xlsx_delete.class : xlsx_delete.scala
	scalac xlsx_delete.scala
clean:
	rm -f *.class
