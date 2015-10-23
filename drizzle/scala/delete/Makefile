SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
drizzle_delete.class : drizzle_delete.scala
	scalac -cp $(CPX) drizzle_delete.scala -deprecation
clean:
	rm -f *.class
