SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
postgre_update.class : postgre_update.scala
	scalac -cp $(CPX) postgre_update.scala -deprecation
clean:
	rm -f *.class
