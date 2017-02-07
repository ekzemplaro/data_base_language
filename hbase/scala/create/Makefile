SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=./:$(SCALA_COMMON)
hbase_create.class: hbase_create.scala 
	scalac -cp $(CPX):`hbase classpath` hbase_create.scala
clean:
	rm -f *.class
