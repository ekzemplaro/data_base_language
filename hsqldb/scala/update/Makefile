SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
hsqldb_update.class : hsqldb_update.scala
	scalac -cp $(CPX) hsqldb_update.scala
clean:
	rm -f *.class
