COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
#
CPP=./:$(JAR)/tika-app-1.0.jar:$(JAVA_COMMON)
#
pdf_update.class: pdf_update.java
	javac -cp $(CPP) pdf_update.java
clean:
	rm -f *.class
