COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
#
export CLASSPATH=./:$(JAVA_COMMON)
xlsx_create.class: xlsx_create.java
	javac xlsx_create.java
clean:
	rm -f *.class
