export COMMON=/var/www/data_base/common
export JAVA_COMMON=$(COMMON)/java_common
export JAR=$(COMMON)/jar
EXIST_HOME=/home/uchida/eXist
LIB_CASSANDRA=$(JAR)/cassandra
MEMCACHED=/home/uchida/dbm/memcached/java/java_memcached
REDIS_JAR=$(JAR)/jedis-2.1.0.jar
L_CORE=$(EXIST_HOME)/lib/core
HBASE=/home/uchida/dbm/hbase/hbase-0.94.11
LIB_HBASE=$(HBASE)/lib
VOLDEMORT=/home/uchida/dbm/voldemort/voldemort-0.90.1
TIKA=$(JAR)/tika-app-1.0.jar
EPUB=$(JAR)/epubgen-0.5.0.jar
ITEXT=$(JAR)/iText-5.0.5.jar
HGDB_JAR=/home/uchida/dbm/hgdb/hypergraphdb-1.1/hypergraphdb.jar
SG_CDB=$(JAR)/sg-cdb-1.0.4.jar
POI313=/var/www/data_base/common/jar/poi-3.13
POI_LIB=$(POI313)/poi-3.13-20150929.jar:$(POI313)/poi-ooxml-3.13-20150929.jar:$(POI313)/poi-ooxml-schemas-3.13-20150929.jar:$(POI313)/ooxml-lib/xmlbeans-2.6.0.jar
#
HTTPCLIENT=$(COMMON)/jar/commons-httpclient
HTTPCLIENT_JAR=.:$(HTTPCLIENT)/commons-httpclient-3.1.jar:$(HTTPCLIENT)/commons-logging-1.2.jar:$(HTTPCLIENT)/commons-codec-1.10.jar
#
#
CPP_A=.:$(EXIST_HOME)/exist.jar:$(L_CORE)/xmldb.jar:$(L_CORE)/log4j-1.2.15.jar
CPP_B=$(CPP_A):$(L_CORE)/xmlrpc-client-3.1.2.jar:$(L_CORE)/xmlrpc-common-3.1.2.jar
CPP_C=$(CPP_B):$(L_CORE)/ws-commons-util-1.0.2.jar
CPP_E=$(CPP_C):/usr/local/lib/tokyocabinet.jar
CPP_F=$(CPP_E):/usr/share/java/commons-httpclient-3.1.jar
CPP_G=$(CPP_F):$(JAR)/jsonic-1.1.2.jar
CPP_H=$(CPP_G):$(LIB_CASSANDRA)/apache-cassandra-1.2.9.jar
CPP_I=$(CPP_H):$(LIB_CASSANDRA)/libthrift-0.7.0.jar
CPP_J=$(CPP_I):$(LIB_CASSANDRA)/log4j-1.2.16.jar:$(LIB_CASSANDRA)/slf4j-api-1.7.2.jar:$(LIB_CASSANDRA)/slf4j-log4j12-1.7.2.jar
CPP_K=$(CPP_J):$(MEMCACHED)/java_memcached-release_2.5.1.jar
CPP_L=$(CPP_K):$(JAR)/mongo-2.6.3.jar:$(REDIS_JAR)
CPP_M=$(CPP_L):/usr/share/java/jxl.jar
CPP_N=$(CPP_M):$(JAR)/commons-net-3.3.jar
#
CPP_P=$(CPP_N):$(VOLDEMORT)/dist/voldemort-0.90.1.jar
CPP=$(CPP_P):$(JAVA_COMMON)
CPP_JSON=./:$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
CPP_TIKA=./:$(TIKA):$(JAVA_COMMON)
CPP_EPUB=./:$(EPUB):$(JAVA_COMMON)
CPP_ITEXT=./:$(ITEXT):$(JAVA_COMMON)
CPP_HGDB=./:$(HGDB_JAR):$(JAVA_COMMON)
CPP_CDB=./:$(SG_CDB):$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
CPP_URI=.:$(HTTPCLIENT_JAR)
CPP_XLSX=.:$(POI_LIB)
CPP_HBASE=`hbase classpath`
#
all: json_manipulate.class \
	xml_manipulate.class \
	get_uri.class \
	xml_manipulate.class \
	text_manipulate.class \
	file_io.class \
	xlsx_manipulate.class \
	mcached_manipulate.class \
	mcached_socket.class \
	cdb_manipulate.class \
	socket_manipulate.class \
	redis_manipulate.class \
	couch_manipulate.class \
	rdb_common.class \
	sql_to_json.class \
	oracle_manipulate.class \
	ftp_manipulate.class \
	cassandra_manipulate.class \
	tika_manipulate.class \
	hbase_manipulate.class \
	tcbn_manipulate.class \
	mongo_manipulate.class \
	epub_manipulate.class \
	pdf_manipulate.class \
	excel_manipulate.class \
	hgdb_manipulate.class \
	voldemort_manipulate.class
cassandra_manipulate.class: cassandra_manipulate.java
	javac -cp $(CPP) cassandra_manipulate.java
json_manipulate.class: json_manipulate.java
	javac -cp $(CPP_JSON) json_manipulate.java -Xlint:unchecked
xml_manipulate.class: xml_manipulate.java
	javac xml_manipulate.java
tcbn_manipulate.class: tcbn_manipulate.java
	javac -cp $(CPP) tcbn_manipulate.java
get_uri.class: get_uri.java
	javac -cp $(CPP_URI) get_uri.java
text_manipulate.class: text_manipulate.java
	javac -cp $(JAVA_COMMON) text_manipulate.java
file_io.class: file_io.java
	javac -cp $(CPP) file_io.java
excel_manipulate.class: excel_manipulate.java
	javac -cp $(CPP) excel_manipulate.java
xlsx_manipulate.class: xlsx_manipulate.java
	javac -cp $(CPP_XLSX) xlsx_manipulate.java
mcached_manipulate.class: mcached_manipulate.java
	javac -cp $(CPP) mcached_manipulate.java -Xlint:unchecked
mcached_socket.class: mcached_socket.java
	javac mcached_socket.java -Xlint:unchecked
cdb_manipulate.class: cdb_manipulate.java
	javac -cp $(CPP_CDB) cdb_manipulate.java -Xlint:unchecked
socket_manipulate.class: socket_manipulate.java
	javac -cp $(CPP) socket_manipulate.java -Xlint:unchecked
redis_manipulate.class: redis_manipulate.java
	javac -cp $(CPP) redis_manipulate.java
couch_manipulate.class: couch_manipulate.java
	javac -cp $(CPP) couch_manipulate.java
rdb_common.class: rdb_common.java
	javac -cp $(CPP) rdb_common.java
ftp_manipulate.class: ftp_manipulate.java
	javac -cp $(CPP) ftp_manipulate.java
tika_manipulate.class: tika_manipulate.java
	javac -cp $(CPP_TIKA) tika_manipulate.java
hbase_manipulate.class: hbase_manipulate.java
	javac -cp $(CPP_HBASE) hbase_manipulate.java
mongo_manipulate.class: mongo_manipulate.java
	javac -cp $(CPP) mongo_manipulate.java
voldemort_manipulate.class: voldemort_manipulate.java
	javac -cp $(CPP) voldemort_manipulate.java -Xlint:unchecked
sql_to_json.class: sql_to_json.java
	javac -cp $(CPP) sql_to_json.java
epub_manipulate.class: epub_manipulate.java
	javac -cp $(CPP_EPUB) epub_manipulate.java
pdf_manipulate.class: pdf_manipulate.java
	javac -cp $(CPP_ITEXT) pdf_manipulate.java
hgdb_manipulate.class: hgdb_manipulate.java
	javac -cp $(CPP_HGDB) hgdb_manipulate.java
oracle_manipulate.class: oracle_manipulate.java
	javac oracle_manipulate.java
html:
	cd html_src;make html
clean:
	rm -f *.class
