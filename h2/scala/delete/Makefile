SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
h2_delete.class : h2_delete.scala
	scalac -cp $(CPX) h2_delete.scala -deprecation
clean:
	rm -f *.class
