COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPATH=.:$(JAVA_COMMON):$(JAR)/epubgen-0.5.0.jar
epub_create.class: epub_create.java
	javac -cp $(CPATH) epub_create.java
clean:
	rm -f *.class
