SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=./:$(SCALA_COMMON)
hbase_delete.class: hbase_delete.scala 
	scalac -cp $(CPX):`hbase classpath` hbase_delete.scala
clean:
	rm -f *.class
