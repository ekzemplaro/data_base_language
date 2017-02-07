COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
CPATH=.:$(SCALA_COMMON):$(JAR)/epubgen-0.5.0.jar
epub_create.class: epub_create.scala
	scalac -cp $(CPATH) epub_create.scala
clean:
	rm -f *.class
