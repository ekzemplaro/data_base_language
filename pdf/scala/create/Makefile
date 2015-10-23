JAR=/var/www/data_base/common/jar
pdf_create.class :  pdf_create.scala
	scalac -cp $(JAR)/iText-5.0.5.jar pdf_create.scala -deprecation
clean:
	rm -f *.class *.pdf
