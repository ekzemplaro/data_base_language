SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=.:$(SCALA_COMMON)
mssql_delete.class : mssql_delete.scala
	scalac -cp $(CPX) mssql_delete.scala -deprecation
clean:
	rm -f *.class
