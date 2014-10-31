export COMMON=/var/www/data_base/common
export JAVA_COMMON=$(COMMON)/java_common
export JAR=$(COMMON)/jar
LIB_CASSANDRA=$(JAR)/cassandra
MEMCACHED_JAR=/home/uchida/dbm/memcached/java/java_memcached/java_memcached-release_2.5.1.jar
REDIS_JAR=$(JAR)/jedis-2.1.0.jar
TCBN_JAR=/usr/local/lib/tokyocabinet.jar
LIB=/var/lib/tomcat7/webapps/data_base/WEB-INF/lib
CPX_A=.:$(JAVA_COMMON):/usr/share/tomcat7/lib/servlet-api.jar
CPX_B=$(CPX_A):/usr/share/java/commons-httpclient-3.1.jar
CPX_C=$(CPX_B):$(JAR)/jsonic-1.1.2.jar
CPX_D=$(CPX_C):$(JAR)/Jaybird/jaybird-full-2.1.6.jar
CPX_E=$(CPX_D):$(LIB_CASSANDRA)/apache-cassandra-0.8.1.jar
CPX_F=$(CPX_E):$(LIB_CASSANDRA)/libthrift-0.6.jar
CPX_G=$(CPX_F):$(MEMCACHED_JAR):$(REDIS_JAR):$(TCBN_JAR)
CPX_H=$(CPX_G):$(LIB_CASSANDRA)/log4j-1.2.16.jar:$(LIB_CASSANDRA)/slf4j-api-1.6.1.jar:$(LIB_CASSANDRA)/slf4j-log4j12-1.6.1.jar
CPX=$(CPX_H):$JAR/commons-net-3.0.1.jar
all: master_java_read.class text_java_read.class \
	 csv_java_read.class \
	 json_java_read.class xml_java_read.class \
	 sqlite3_java_read.class \
	 	mysql_java_read.class \
	 	postgre_java_read.class \
	 	firebird_java_read.class \
	 	oracle_java_read.class \
	 	mssql_java_read.class \
	 	db2_java_read.class \
	 	derby_java_read.class \
	 	hsqldb_java_read.class \
	 	h2_java_read.class \
	 	exist_java_read.class \
	 	dbxml_java_read.class \
	 	xindice_java_read.class \
	 	mcached_java_read.class \
	 	mcachedb_java_read.class \
	 	redis_java_read.class \
	 	couch_java_read.class \
	 	ftp_java_read.class \
	 	webdav_java_read.class \
	 	mongo_java_read.class \
	 	tcbn_java_read.class \
	 	cassandra_java_read.class
master_java_read.class: master_java_read.java
	javac -cp $(CPX) master_java_read.java
text_java_read.class: text_java_read.java
	javac -cp $(CPX) text_java_read.java
csv_java_read.class: csv_java_read.java
	javac -cp $(CPX) csv_java_read.java
xml_java_read.class: xml_java_read.java
	javac -cp $(CPX) xml_java_read.java
json_java_read.class: json_java_read.java
	javac -cp $(CPX) json_java_read.java
sqlite3_java_read.class: sqlite3_java_read.java
	javac -cp $(CPX) sqlite3_java_read.java
mysql_java_read.class: mysql_java_read.java
	javac -cp $(CPX) mysql_java_read.java
postgre_java_read.class: postgre_java_read.java
	javac -cp $(CPX) postgre_java_read.java
firebird_java_read.class: firebird_java_read.java
	javac -cp $(CPX) firebird_java_read.java
oracle_java_read.class: oracle_java_read.java
	javac -cp $(CPX) oracle_java_read.java
mssql_java_read.class: mssql_java_read.java
	javac -cp $(CPX) mssql_java_read.java
db2_java_read.class: db2_java_read.java
	javac -cp $(CPX) db2_java_read.java
derby_java_read.class: derby_java_read.java
	javac -cp $(CPX) derby_java_read.java
hsqldb_java_read.class: hsqldb_java_read.java
	javac -cp $(CPX) hsqldb_java_read.java
h2_java_read.class: h2_java_read.java
	javac -cp $(CPX) h2_java_read.java
xindice_java_read.class: xindice_java_read.java
	javac -cp $(CPX) xindice_java_read.java
exist_java_read.class: exist_java_read.java
	javac -cp $(CPX) exist_java_read.java
dbxml_java_read.class: dbxml_java_read.java
	javac -cp $(CPX) dbxml_java_read.java
mcached_java_read.class: mcached_java_read.java
	javac -cp $(CPX) mcached_java_read.java
mcachedb_java_read.class: mcachedb_java_read.java
	javac -cp $(CPX) mcachedb_java_read.java
redis_java_read.class: redis_java_read.java
	javac -cp $(CPX) redis_java_read.java
tcbn_java_read.class: tcbn_java_read.java
	javac -cp $(CPX) tcbn_java_read.java
couch_java_read.class: couch_java_read.java
	javac -cp $(CPX) couch_java_read.java
ftp_java_read.class: ftp_java_read.java
	javac -cp $(CPX) ftp_java_read.java
webdav_java_read.class: webdav_java_read.java
	javac -cp $(CPX) webdav_java_read.java
mongo_java_read.class: mongo_java_read.java
	javac -cp $(CPX) mongo_java_read.java
cassandra_java_read.class: cassandra_java_read.java
	javac -cp $(CPX) cassandra_java_read.java
clean:
	rm -f *.class
