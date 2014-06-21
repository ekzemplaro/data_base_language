SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
mysql_create.class : mysql_create.scala
	scalac -cp $(CPX) mysql_create.scala
clean:
	rm -f *.class
