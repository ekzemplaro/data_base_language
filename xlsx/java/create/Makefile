COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
POI311=$(COMMON)/jar/poi-3.11
export CLASSPATH=./:$(JAVA_COMMON):$(POI311)/poi-3.11-20141221.jar:$(POI311)/poi-ooxml-3.11-20141221.jar
xlsx_create.class: xlsx_create.java
	javac xlsx_create.java
clean:
	rm -f *.class
