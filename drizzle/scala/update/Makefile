SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
drizzle_update.class : drizzle_update.scala
	scalac -cp $(CPX) drizzle_update.scala -deprecation
clean:
	rm -f *.class
