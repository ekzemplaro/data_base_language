COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
POI39=$(COMMON)/jar/poi-3.9
export CLASSPATH=./:$(SCALA_COMMON):$(POI39)/poi-3.9-20121203.jar:$(POI39)/poi-ooxml-3.9-20121203.jar:$(POI39)/poi-ooxml-schemas-3.9-20121203.jar:$(POI39)/ooxml-lib/xmlbeans-2.3.0.jar
xlsx_delete.class : xlsx_delete.scala
	scalac xlsx_delete.scala
clean:
	rm -f *.class
