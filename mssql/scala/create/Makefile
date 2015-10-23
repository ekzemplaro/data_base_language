SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
mssql_create.class : mssql_create.scala
	scalac -cp $(CPX) mssql_create.scala
clean:
	rm -f *.class
