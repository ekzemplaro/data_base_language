SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
#
couch_read.class : couch_read.scala
	scalac -deprecation -cp $(CPX) couch_read.scala
clean:
	rm -f *.class
