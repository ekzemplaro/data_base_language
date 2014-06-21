SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
derby_delete.class : derby_delete.scala
	scalac -cp $(CPX) derby_delete.scala
clean:
	rm -f *.class
