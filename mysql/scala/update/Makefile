SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
mysql_update.class : mysql_update.scala
	scalac -cp $(CPX) mysql_update.scala -deprecation
clean:
	rm -f *.class
