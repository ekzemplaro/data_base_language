SCALA_COMMON=/var/www/data_base/common/scala_common
export CLASSPATH=.:$(SCALA_COMMON):/usr/share/java/jxl.jar
excel_delete.class : excel_delete.scala
	scalac excel_delete.scala
clean:
	rm -f *.class
