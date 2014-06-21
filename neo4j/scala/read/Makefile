SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
#
neo4j_read.class : neo4j_read.scala
	scalac -cp $(CPX) neo4j_read.scala
clean:
	rm -f *.class
