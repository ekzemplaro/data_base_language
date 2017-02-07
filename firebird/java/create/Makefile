COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
#
FIREBIRD_JAR=$(JAR)/Jaybird/jaybird-full-2.1.6.jar
CPX=.:$(JAVA_COMMON):$(FIREBIRD_JAR)
firebird_create.class: firebird_create.java
	javac -cp $(CPX) firebird_create.java
clean:
	rm -f *.class
