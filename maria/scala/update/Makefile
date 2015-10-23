SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
maria_update.class : maria_update.scala
	scalac -cp $(CPX) maria_update.scala -deprecation
clean:
	rm -f *.class
