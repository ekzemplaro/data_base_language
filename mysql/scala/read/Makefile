SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
mysql_read.class : mysql_read.scala
	scalac -cp $(CPX) mysql_read.scala
clean:
	rm -f *.class
