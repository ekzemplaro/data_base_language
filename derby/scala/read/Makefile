SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
derby_read.class : derby_read.scala
	scalac -cp $(CPX) derby_read.scala
clean:
	rm -f *.class
