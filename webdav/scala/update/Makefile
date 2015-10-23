SCALA_COMMON=/var/www/data_base/common/scala_common
CPP_A=/usr/share/java/commons-httpclient-3.1.jar
CPP_B=$(CPP_A):$(SCALA_COMMON)
webdav_update.class: webdav_update.scala
	scalac -cp $(CPP_B) webdav_update.scala
clean:
	rm -f *.class
