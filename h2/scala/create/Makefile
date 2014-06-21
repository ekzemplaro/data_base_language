SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
h2_create.class : h2_create.scala
	scalac -cp $(CPX) h2_create.scala -deprecation
clean:
	rm -f *.class
