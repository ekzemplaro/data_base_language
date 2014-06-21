SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
postgre_delete.class : postgre_delete.scala
	scalac -cp $(CPX) postgre_delete.scala -deprecation
clean:
	rm -f *.class
