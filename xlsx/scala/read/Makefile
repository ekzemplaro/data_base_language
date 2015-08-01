COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
POI312=$(COMMON)/jar/poi-3.12
export CLASSPATH=./:$(SCALA_COMMON):$(POI312)/poi-3.12-20150511.jar:$(POI312)/poi-ooxml-3.12-20150511.jar:$(POI312)/poi-ooxml-schemas-3.12-20150511.jar:$(POI312)/ooxml-lib/xmlbeans-2.6.0.jar
xlsx_read.class : xlsx_read.scala
	scalac xlsx_read.scala
clean:
	rm -f *.class
