export COMMON=/var/www/data_base/common
export JAVA_COMMON=$(COMMON)/java_common
export JAR=$(COMMON)/jar
SHARE=/usr/share/java
HTTPCLIENT=$(SHARE)/commons-httpclient-3.1.jar
MEMCACHED_JAR=$(JAR)/memcached/java_memcached-release_2.6.3.jar
MONGO_JAR=$(JAR)/mongo-2.8.0.jar
REDIS_JAR=$(JAR)/jedis-2.1.0.jar
LIB_HBASE=$(HBASE)/lib
LIB_CASSANDRA=$(JAR)/cassandra
VOLDEMORT=/home/uchida/dbm/voldemort/voldemort-1.3.0
POI39=/var/www/data_base/common/jar/poi-3.9
#
CPP_A=./:$(HTTPCLIENT):$(MEMCACHED_JAR):$(MONGO_JAR):$(REDIS_JAR):/usr/share/java/jxl.jar
CPP_B=$(CPP_A):$(JAR)/commons-net-3.0.1.jar
CPP_C=$(CPP_B):$(JAR)/jsonic-1.1.2.jar
#
#
CPP_I=$(CPP_C):$(LIB_CASSANDRA)/apache-cassandra-1.2.9.jar
CPP_J=$(CPP_I):$(LIB_CASSANDRA)/libthrift-0.7.0.jar
CPP_K=$(CPP_J):$(LIB_CASSANDRA)/log4j-1.2.16.jar:$(LIB_CASSANDRA)/slf4j-api-1.6.1.jar:$(LIB_CASSANDRA)/slf4j-log4j12-1.6.1.jar
CPP_L=$(CPP_K):/usr/local/lib/tokyocabinet.jar
CPP_M=$(CPP_L):$(VOLDEMORT)/dist/voldemort-1.3.0.jar
CPP=$(CPP_M)
CPP_XLSX=.:$(POI39)/poi-3.9-20121203.jar:$(POI39)/poi-ooxml-3.9-20121203.jar:$(POI39)/poi-ooxml-schemas-3.9-20121203.jar:$(POI39)/ooxml-lib/xmlbeans-2.3.0.jar
CPP_HBASE=`hbase classpath`
#
all: text_manipulate.class \
	file_io.class \
	xml_manipulate.class \
	json_manipulate.class \
	sql_manipulate.class \
	redis_manipulate.class \
	ftp_manipulate.class \
	get_uri.class \
	mongo_manipulate.class \
	mcached_manipulate.class \
	tcbn_manipulate.class \
	cassandra_manipulate.class \
	hbase_manipulate.class \
	voldemort_manipulate.class \
	excel_manipulate.class \
	xlsx_manipulate.class
text_manipulate.class: text_manipulate.scala
	scalac text_manipulate.scala
file_io.class: file_io.scala
	scalac file_io.scala
xml_manipulate.class: xml_manipulate.scala
	scalac xml_manipulate.scala
json_manipulate.class: json_manipulate.scala
	scalac -deprecation json_manipulate.scala
excel_manipulate.class: excel_manipulate.scala
	scalac -cp $(CPP) excel_manipulate.scala
ftp_manipulate.class: ftp_manipulate.scala
	scalac -cp $(CPP) ftp_manipulate.scala
hbase_manipulate.class: hbase_manipulate.scala
	scalac -cp $(CPP_HBASE) -deprecation  hbase_manipulate.scala
mongo_manipulate.class: mongo_manipulate.scala
	scalac -cp $(CPP) mongo_manipulate.scala
mcached_manipulate.class: mcached_manipulate.scala
	scalac -cp $(CPP) mcached_manipulate.scala
get_uri.class: get_uri.scala
	scalac -cp $(CPP) get_uri.scala
redis_manipulate.class: redis_manipulate.scala
	scalac -cp $(CPP) redis_manipulate.scala
cassandra_manipulate.class: cassandra_manipulate.scala
	scalac -cp $(CPP) cassandra_manipulate.scala
sql_manipulate.class: sql_manipulate.scala
	scalac -cp $(CPP) sql_manipulate.scala
tcbn_manipulate.class: tcbn_manipulate.scala
	scalac -cp $(CPP) tcbn_manipulate.scala
voldemort_manipulate.class: voldemort_manipulate.scala
	scalac -cp $(CPP) voldemort_manipulate.scala
xlsx_manipulate.class: xlsx_manipulate.scala
	scalac -cp $(CPP_XLSX) xlsx_manipulate.scala
html:
	cd html_src;make html
clean:
	rm -f *.class
