SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
mysql_delete.class : mysql_delete.scala
	scalac -cp $(CPX) mysql_delete.scala -deprecation
clean:
	rm -f *.class
