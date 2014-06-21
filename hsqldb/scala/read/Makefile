SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
hsqldb_read.class : hsqldb_read.scala
	scalac -cp $(CPX) hsqldb_read.scala
clean:
	rm -f *.class
