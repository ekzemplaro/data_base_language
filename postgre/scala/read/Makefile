SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
postgre_read.class : postgre_read.scala
	scalac -cp $(CPX) postgre_read.scala
clean:
	rm -f *.class
