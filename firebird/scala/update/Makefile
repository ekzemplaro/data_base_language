SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
firebird_update.class : firebird_update.scala
	scalac -cp $(CPX) firebird_update.scala -deprecation
clean:
	rm -f *.class
