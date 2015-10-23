SCALA_COMMON=/var/www/data_base/common/scala_common
export CLASSPATH=.:$(SCALA_COMMON):/usr/share/java/jxl.jar
excel_create.class : excel_create.scala
	scalac excel_create.scala
clean:
	rm -f *.class
