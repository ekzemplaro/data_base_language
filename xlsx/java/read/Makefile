COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
export CLASSPATH=./:$(JAVA_COMMON)
xlsx_read.class: xlsx_read.java
	javac xlsx_read.java
clean:
	rm -f *.class
