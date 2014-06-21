SCALA_COMMON=/var/www/data_base/common/scala_common
CPP_A=/usr/share/java/commons-httpclient-3.1.jar
CPP_B=$(CPP_A):$(SCALA_COMMON)
webdav_delete.class: webdav_delete.scala
	scalac -cp $(CPP_B) webdav_delete.scala
clean:
	rm -f *.class
