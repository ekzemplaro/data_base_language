SCALA_COMMON=/var/www/data_base/common/scala_common
export CLASSPATH=.:$(SCALA_COMMON):/usr/share/java/jxl.jar
excel_update.class : excel_update.scala
	scalac excel_update.scala
clean:
	rm -f *.class
