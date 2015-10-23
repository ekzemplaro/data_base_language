SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
firebird_create.class : firebird_create.scala
	scalac -cp $(CPX) firebird_create.scala
clean:
	rm -f *.class
