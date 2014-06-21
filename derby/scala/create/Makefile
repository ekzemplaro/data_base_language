SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
derby_create.class : derby_create.scala
	scalac -cp $(CPX) derby_create.scala
clean:
	rm -f *.class
