JAVA_COMMON="/var/www/data_base/common/java_common"
CPX=.:$(JAVA_COMMON)
oracle_create.class : oracle_create.scala
	scalac -cp $(CPX) oracle_create.scala
clean:
	rm -f *.class
