SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
#
riak_read.class : riak_read.scala
	scalac -cp $(CPX) riak_read.scala
clean:
	rm -f *.class
