COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
#
FIREBIRD_JAR=$(JAR)/Jaybird/jaybird-full-2.1.6.jar
CPX=.:$(JAVA_COMMON):$(FIREBIRD_JAR)
#
firebird_delete.class: firebird_delete.java
	javac -cp $(CPX) firebird_delete.java
clean:
	rm -f *.class
