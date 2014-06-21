SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
hsqldb_create.class : hsqldb_create.scala
	scalac -cp $(CPX) hsqldb_create.scala
clean:
	rm -f *.class
