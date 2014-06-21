JAVA_COMMON=/var/www/data_base/common/java_common
CPX=.:$(JAVA_COMMON)
oracle_update.class : oracle_update.scala
	scalac -cp $(CPX) oracle_update.scala -deprecation
clean:
	rm -f *.class
