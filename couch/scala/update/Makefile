SCALA_COMMON=/var/www/data_base/common/scala_common
CPP_A=/usr/share/java/commons-httpclient-3.1.jar
CPP_B=$(CPP_A):$(SCALA_COMMON)
couch_update.class: couch_update.scala
	scalac -cp $(CPP_B) couch_update.scala
clean:
	rm -f *.class
