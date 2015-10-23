COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
#
CPP=./:$(JAR)/tika-app-1.0.jar:$(JAVA_COMMON)
#
pdf_delete.class: pdf_delete.java
	javac -cp $(CPP) pdf_delete.java
clean:
	rm -f *.class
