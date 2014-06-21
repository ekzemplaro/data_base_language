SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
maria_delete.class : maria_delete.scala
	scalac -cp $(CPX) maria_delete.scala -deprecation
clean:
	rm -f *.class
