COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
#
export CLASSPATH=./:$(JAVA_COMMON):/usr/share/java/apache-poi:/usr/share/java/apache-poi/lib:/usr/share/java/apache-poi/ooxml-lib
#
xlsx_read.class: xlsx_read.java
	javac xlsx_read.java
clean:
	rm -f *.class
