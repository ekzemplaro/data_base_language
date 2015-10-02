COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
#
export CLASSPATH=./:$(JAVA_COMMON)
xlsx_update.class: xlsx_update.java
	javac xlsx_update.java
clean:
	rm -f *.class
