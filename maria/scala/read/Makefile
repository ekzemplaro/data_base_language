SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
maria_read.class : maria_read.scala
	scalac -cp $(CPX) maria_read.scala
clean:
	rm -f *.class
