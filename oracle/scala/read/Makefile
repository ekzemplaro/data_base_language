JAVA_COMMON="/var/www/data_base/common/java_common"
CPX=.:$(JAVA_COMMON)
oracle_read.class : oracle_read.scala
	scalac -cp $(CPX) oracle_read.scala
clean:
	rm -f *.class
