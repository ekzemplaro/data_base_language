SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
json_update.class : json_update.scala
	scalac -cp $(CPX) json_update.scala
clean:
	rm -f *.class
