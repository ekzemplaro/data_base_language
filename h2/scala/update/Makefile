SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
h2_update.class : h2_update.scala
	scalac -cp $(CPX) h2_update.scala -deprecation
clean:
	rm -f *.class
