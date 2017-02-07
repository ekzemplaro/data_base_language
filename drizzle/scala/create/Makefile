SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
drizzle_create.class : drizzle_create.scala
	scalac -cp $(CPX) drizzle_create.scala
clean:
	rm -f *.class
