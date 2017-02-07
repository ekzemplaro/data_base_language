SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
json_delete.class : json_delete.scala
	scalac -cp $(CPX) json_delete.scala
clean:
	rm -f *.class
