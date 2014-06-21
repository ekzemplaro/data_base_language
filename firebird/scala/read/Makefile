SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
firebird_read.class : firebird_read.scala
	scalac -cp $(CPX) firebird_read.scala
clean:
	rm -f *.class
