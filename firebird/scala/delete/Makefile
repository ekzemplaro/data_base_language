SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
firebird_delete.class : firebird_delete.scala
	scalac -cp $(CPX) firebird_delete.scala -deprecation
clean:
	rm -f *.class
