SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=./:$(SCALA_COMMON)
hbase_update.class: hbase_update.scala 
	scalac -cp $(CPX):`hbase classpath` hbase_update.scala
clean:
	rm -f *.class
