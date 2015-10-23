SCALA_COMMON=/var/www/data_base/common/scala_common
CPP_A=/usr/share/java/commons-httpclient-3.1.jar
CPP_B=$(CPP_A):$(SCALA_COMMON)
webdav_create.class: webdav_create.scala
	scalac -cp $(CPP_B) webdav_create.scala
clean:
	rm -f *.class
