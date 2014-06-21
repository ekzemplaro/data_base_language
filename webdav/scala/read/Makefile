SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
#
webdav_read.class : webdav_read.scala
	scalac -cp $(CPX) webdav_read.scala
clean:
	rm -f *.class
