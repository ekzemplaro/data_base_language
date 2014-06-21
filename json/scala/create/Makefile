SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
json_create.class : json_create.scala
	scalac -cp $(CPX) json_create.scala
clean:
	rm -f *.class
