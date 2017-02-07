COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPX=./:$(JAVA_COMMON)/:$(JAR)/iText-5.0.5.jar
pdf_create.class :  pdf_create.java
	javac -cp $(CPX) pdf_create.java
clean:
	rm -f *.class *.pdf
