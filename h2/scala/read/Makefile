SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
h2_read.class : h2_read.scala
	scalac -cp $(CPX) h2_read.scala
clean:
	rm -f *.class
