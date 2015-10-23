SCALA_COMMON=/var/www/data_base/common/scala_common
CPP=./:$(SCALA_COMMON)
mcachedb_update.class: mcachedb_update.scala
	scalac -cp $(CPP) mcachedb_update.scala -unchecked
clean:
	rm -f *.class
