SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
drizzle_read.class : drizzle_read.scala
	scalac -cp $(CPX) drizzle_read.scala
clean:
	rm -f *.class
