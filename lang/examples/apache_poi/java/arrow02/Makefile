COMMON=/var/www/data_base/common
POI313=$(COMMON)/jar/poi-3.13
POI_LIB=$(POI313)/poi-3.13-20150929.jar:$(POI313)/poi-ooxml-3.13-20150929.jar:$(POI313)/poi-ooxml-schemas-3.13-20150929.jar:$(POI313)/ooxml-lib/xmlbeans-2.6.0.jar
#
CPX=./:../common:$(POI_LIB)
arrow02.class: arrow02.java
	javac -cp $(CPX) arrow02.java
clean:
	rm -f *.class
