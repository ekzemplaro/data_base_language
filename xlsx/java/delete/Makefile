COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
export CLASSPATH=./:$(JAVA_COMMON)
xlsx_delete.class: xlsx_delete.java
	javac xlsx_delete.java
clean:
	rm -f *.class
