SCALA_COMMON=/var/www/data_base/common/scala_common
export CLASSPATH=.:$(SCALA_COMMON):/usr/share/java/jxl.jar
excel_read.class : excel_read.scala
	scalac excel_read.scala
clean:
	rm -f *.class
