COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
POI39=$(COMMON)/jar/poi-3.9
export CLASSPATH=./:$(JAVA_COMMON):$(POI39)/poi-3.9-20121203.jar:$(POI39)/poi-ooxml-3.9-20121203.jar
xlsx_read.class: xlsx_read.java
	javac xlsx_read.java
clean:
	rm -f *.class
