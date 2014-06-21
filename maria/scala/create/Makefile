SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
maria_create.class : maria_create.scala
	scalac -cp $(CPX) maria_create.scala
clean:
	rm -f *.class
