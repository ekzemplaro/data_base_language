JAVA_COMMON=/var/www/data_base/common/java_common
DBXML=/home/uchida/xml_database/berkeley/dbxml-2.5.16
LIB=$(DBXML)/install/lib
export CLASSPATH=./:$(LIB)/db.jar:$(LIB)/dbxml.jar:$(JAVA_COMMON)
dbxml_create.class: dbxml_create.java
	javac dbxml_create.java 
clean:
	rm -f *.class
