JAVA_COMMON=/var/www/data_base/common/java_common
CPX=.:$(JAVA_COMMON)
oracle_delete.class : oracle_delete.scala
	scalac -cp $(CPX) oracle_delete.scala -deprecation
clean:
	rm -f *.class
