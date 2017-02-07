COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
#
CPP=./:$(JAR)/tika-app-1.0.jar:$(JAVA_COMMON)
#
epub_update.class: epub_update.java
	javac -cp $(CPP) epub_update.java
clean:
	rm -f *.class
