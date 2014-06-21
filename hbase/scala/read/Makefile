SCALA_COMMON=/var/www/data_base/common/scala_common

CPX=./:$(SCALA_COMMON)
hbase_read.class: hbase_read.scala 
	scalac -cp $(CPX):`hbase classpath` hbase_read.scala
clean:
	rm -f *.class
