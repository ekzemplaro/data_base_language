SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
mssql_update.class : mssql_update.scala
	scalac -cp $(CPX) mssql_update.scala -deprecation
clean:
	rm -f *.class
