SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
hsqldb_delete.class : hsqldb_delete.scala
	scalac -cp $(CPX) hsqldb_delete.scala
clean:
	rm -f *.class
