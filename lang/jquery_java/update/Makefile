COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
LIB_CASSANDRA=/home/uchida/dbm/cassandra/apache-cassandra-0.6.8/lib
MEMCACHED_JAR=/home/uchida/dbm/memcached/java/java_memcached/java_memcached-release_2.5.1.jar
REDIS_JAR=$(JAR)/jedis-2.1.0.jar
LIB=/var/lib/tomcat7/webapps/uchida/WEB-INF/lib
CPX_A=.:$(JAVA_COMMON):/usr/share/tomcat6/lib/servlet-api.jar
CPX_B=$(CPX_A):/usr/share/java/commons-httpclient-3.1.jar
CPX_C=$(CPX_B):$(JAR)/jsonic-1.1.2.jar
CPX_D=$(CPX_C):$(LIB)/jaybird-full-2.1.6.jar
CPX_E=$(CPX_D):$(LIB_CASSANDRA)/apache-cassandra-0.6.8.jar
CPX_F=$(CPX_E):$(LIB_CASSANDRA)/libthrift-r917130.jar
CPX_G=$(CPX_F):$(LIB_CASSANDRA)/log4j-1.2.14.jar:$(LIB_CASSANDRA)/slf4j-api-1.5.8.jar:$(LIB_CASSANDRA)/slf4j-log4j12-1.5.8.jar
CPX=$(CPX_G):$(MEMCACHED_JAR):$(REDIS_JAR)
all: master_java_update.class text_java_update.class \
	 csv_java_update.class \
	 xml_java_update.class json_java_update.class \
	 sqlite3_java_update.class \
	 	mysql_java_update.class \
	 	postgre_java_update.class \
	 	firebird_java_update.class \
	 	oracle_java_update.class \
	 	mssql_java_update.class \
	 	db2_java_update.class \
	 	derby_java_update.class \
	 	hsqldb_java_update.class \
	 	h2_java_update.class \
	 	exist_java_update.class \
	 	xindice_java_update.class \
	 	couch_java_update.class \
	 	ftp_java_update.class \
	 	webdav_java_update.class \
	 	mcached_java_update.class \
	 	mcachedb_java_update.class \
	 	redis_java_update.class \
	 	mongo_java_update.class \
	 	tcbn_java_update.class \
	 	cassandra_java_update.class
master_java_update.class: master_java_update.java
	javac -cp $(CPX) master_java_update.java
text_java_update.class: text_java_update.java
	javac -cp $(CPX) text_java_update.java
csv_java_update.class: csv_java_update.java
	javac -cp $(CPX) csv_java_update.java
xml_java_update.class: xml_java_update.java
	javac -cp $(CPX) xml_java_update.java
json_java_update.class: json_java_update.java
	javac -cp $(CPX) json_java_update.java
sqlite3_java_update.class: sqlite3_java_update.java
	javac -cp $(CPX) sqlite3_java_update.java
mysql_java_update.class: mysql_java_update.java
	javac -cp $(CPX) mysql_java_update.java
postgre_java_update.class: postgre_java_update.java
	javac -cp $(CPX) postgre_java_update.java
firebird_java_update.class: firebird_java_update.java
	javac -cp $(CPX) firebird_java_update.java
oracle_java_update.class: oracle_java_update.java
	javac -cp $(CPX) oracle_java_update.java
mssql_java_update.class: mssql_java_update.java
	javac -cp $(CPX) mssql_java_update.java
db2_java_update.class: db2_java_update.java
	javac -cp $(CPX) db2_java_update.java
derby_java_update.class: derby_java_update.java
	javac -cp $(CPX) derby_java_update.java
hsqldb_java_update.class: hsqldb_java_update.java
	javac -cp $(CPX) hsqldb_java_update.java
h2_java_update.class: h2_java_update.java
	javac -cp $(CPX) h2_java_update.java
xindice_java_update.class: xindice_java_update.java
	javac -cp $(CPX) xindice_java_update.java
exist_java_update.class: exist_java_update.java
	javac -cp $(CPX) exist_java_update.java
mcached_java_update.class: mcached_java_update.java
	javac -cp $(CPX) mcached_java_update.java
mcachedb_java_update.class: mcachedb_java_update.java
	javac -cp $(CPX) mcachedb_java_update.java
redis_java_update.class: redis_java_update.java
	javac -cp $(CPX) redis_java_update.java
tcbn_java_update.class: tcbn_java_update.java
	javac -cp $(CPX) tcbn_java_update.java
couch_java_update.class: couch_java_update.java
	javac -cp $(CPX) couch_java_update.java
ftp_java_update.class: ftp_java_update.java
	javac -cp $(CPX) ftp_java_update.java
webdav_java_update.class: webdav_java_update.java
	javac -cp $(CPX) webdav_java_update.java
mongo_java_update.class: mongo_java_update.java
	javac -cp $(CPX) mongo_java_update.java
cassandra_java_update.class: cassandra_java_update.java
	javac -cp $(CPX) cassandra_java_update.java
clean:
	rm -f *.class
