COMMON=/var/www/data_base/common
export JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
SHARE=/usr/share/java
HTTPCLIENT=$(JAR)/commons-httpclient
HTTPCLIENT_JAR=.:$(HTTPCLIENT)/commons-httpclient-3.1.jar:$(HTTPCLIENT)/commons-logging-1.2.jar:$(HTTPCLIENT)/commons-codec-1.10.jar
#
MEMCACHED_JAR=$(JAR)/memcached/java_memcached-release_2.6.3.jar
MONGO_JAR=$(JAR)/mongo-2.8.0.jar
REDIS_JAR=$(JAR)/jedis-2.1.0.jar
LIB_HBASE=$(HBASE)/lib
LIB_CASSANDRA=$(JAR)/cassandra
VOLDEMORT=/home/uchida/dbm/voldemort/voldemort-1.3.0
POI313=/var/www/data_base/common/jar/poi-3.13
POI_LIB=$(POI313)/poi-3.13-20150929.jar:$(POI313)/poi-ooxml-3.13-20150929.jar:$(POI313)/poi-ooxml-schemas-3.13-20150929.jar:$(POI313)/ooxml-lib/xmlbeans-2.6.0.jar
#
JSON4S=$(COMMON)/jar/json4s
#
CPP_A=./:$(HTTPCLIENT):$(MEMCACHED_JAR):$(MONGO_JAR):$(REDIS_JAR):/usr/share/java/jxl.jar
CPP_B=$(CPP_A):$(JAR)/commons-net-3.3.jar
CPP_C=$(CPP_B):$(JAR)/jsonic-1.1.2.jar
#
#
CPP_I=$(CPP_C):$(LIB_CASSANDRA)/apache-cassandra-1.2.9.jar
CPP_J=$(CPP_I):$(LIB_CASSANDRA)/libthrift-0.7.0.jar
CPP_K=$(CPP_J):$(LIB_CASSANDRA)/log4j-1.2.16.jar:$(LIB_CASSANDRA)/slf4j-api-1.6.1.jar:$(LIB_CASSANDRA)/slf4j-log4j12-1.6.1.jar
CPP_L=$(CPP_K):/usr/local/lib/tokyocabinet.jar
CPP_M=$(CPP_L):$(VOLDEMORT)/dist/voldemort-1.3.0.jar
CPP=$(CPP_M)
CPP_XLSX=.:$(POI_LIB)
CPP_HBASE=`hbase classpath`
JSON4S_JAR=$(JSON4S)/json4s-core_2.11-3.2.11.jar:$(JSON4S)/json4s-native_2.11-3.2.11.jar:$(JSON4S)/json4s-ast_2.11-3.2.11.jar
CPP_MCACHED=.:$(JSON4S_JAR)
CPP_REDIS=.:$(JSON4S_JAR):$(REDIS_JAR)
CPP_JSON=.:$(JSON4S_JAR)
CPP_URI=.:$(HTTPCLIENT_JAR)
CPP_CDB=.:$(JAR)/sg-cdb-1.0.4.jar:$(JAR)/jsonic-1.1.2.jar
#
all: text_manipulate.class \
	file_io.class \
	xml_manipulate.class \
	sql_manipulate.class \
	ftp_manipulate.class \
	mcached_manipulate.class \
	redis_manipulate.class \
	json_manipulate.class \
	get_uri.class \
	xlsx_manipulate.class \
	cdb_manipulate.class \
	mongo_manipulate.class \
	tcbn_manipulate.class \
	cassandra_manipulate.class \
	hbase_manipulate.class \
	voldemort_manipulate.class \
	excel_manipulate.class
text_manipulate.class: text_manipulate.scala
	scalac text_manipulate.scala
file_io.class: file_io.scala
	scalac file_io.scala
xml_manipulate.class: xml_manipulate.scala
	scalac xml_manipulate.scala
excel_manipulate.class: excel_manipulate.scala
	scalac -cp $(CPP) excel_manipulate.scala
ftp_manipulate.class: ftp_manipulate.scala
	scalac -cp $(CPP) ftp_manipulate.scala
mongo_manipulate.class: mongo_manipulate.scala
	scalac -cp $(CPP) mongo_manipulate.scala
hbase_manipulate.class: hbase_manipulate.scala
	scalac -cp $(CPP_HBASE) -deprecation  hbase_manipulate.scala
xlsx_manipulate.class: xlsx_manipulate.scala
	scalac -cp $(CPP_XLSX) xlsx_manipulate.scala
mcached_manipulate.class: mcached_manipulate.scala
	scalac -cp $(CPP_MCACHED) mcached_manipulate.scala
get_uri.class: get_uri.scala
	scalac -cp $(CPP_URI) get_uri.scala
redis_manipulate.class: redis_manipulate.scala
	scalac -cp $(CPP_REDIS) redis_manipulate.scala
json_manipulate.class: json_manipulate.scala
	scalac -cp $(CPP_JSON) json_manipulate.scala
cassandra_manipulate.class: cassandra_manipulate.scala
	scalac -cp $(CPP) cassandra_manipulate.scala
sql_manipulate.class: sql_manipulate.scala
	scalac -cp $(CPP) sql_manipulate.scala
tcbn_manipulate.class: tcbn_manipulate.scala
	scalac -cp $(CPP) tcbn_manipulate.scala
voldemort_manipulate.class: voldemort_manipulate.scala
	scalac -cp $(CPP) voldemort_manipulate.scala
cdb_manipulate.class: cdb_manipulate.scala
	scalac -cp $(CPP_CDB) cdb_manipulate.scala
html:
	cd html_src;make html
clean:
	rm -f *.class
