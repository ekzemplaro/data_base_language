SCALA_COMMON="/var/www/data_base/common/scala_common"
CPX=.:$(SCALA_COMMON)
mssql_read.class : mssql_read.scala
	scalac -cp $(CPX) mssql_read.scala
clean:
	rm -f *.class
