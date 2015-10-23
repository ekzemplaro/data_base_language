SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
postgre_create.class : postgre_create.scala
	scalac -cp $(CPX) postgre_create.scala
clean:
	rm -f *.class
