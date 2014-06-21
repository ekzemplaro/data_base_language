SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
derby_update.class : derby_update.scala
	scalac -cp $(CPX) derby_update.scala
clean:
	rm -f *.class
