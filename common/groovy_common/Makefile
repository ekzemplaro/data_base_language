COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
GROOVY_COMMON=$(COMMON)/groovy_common
JAR=$(COMMON)/jar
REDIS_JAR=$(JAR)/jredis-1.0-rc2.jar
LIB_HBASE=$(HBASE)/lib
LIB_CASSANDRA=$(JAR)/cassandra
VOLDEMORT=/home/uchida/dbm/voldemort/voldemort-0.90.1
TIKA=$(JAR)/tika-app-1.0.jar
EPUB=$(JAR)/epubgen-0.5.0.jar
HGDB_JAR=/home/uchida/dbm/hgdb/hypergraphdb-1.1/hypergraphdb.jar
SG_CDB=$(JAR)/sg-cdb-1.0.4.jar
POI312=/var/www/data_base/common/jar/poi-3.12
MONGO_JAR=$(JAR)/mongo-2.8.0.jar
HTTPCLIENT=$(JAR)/commons-httpclient
HTTPCLIENT_JAR=$(HTTPCLIENT)/commons-httpclient-3.1.jar:$(HTTPCLIENT)/commons-logging-1.2.jar:$(HTTPCLIENT)/commons-codec-1.10.jar
#
CPP_A=/usr/share/java/commons-httpclient-3.1.jar
CPP_B=/usr/share/java/json-lib-2.3.jar:/usr/share/java/xom-1.2.1.jar:/usr/share/java/commons-beanutils.jar
CPP_C=/usr/share/java/commons-lang-2.4.jar:/usr/share/java/ezmorph-1.0.6.jar:/usr/share/java/junit4-4.8.1.jar:/usr/share/java/oro-2.0.8.jar:/usr/share/java/commons-logging-1.1.1.jar:/usr/share/java/commons-collections3-3.2.1.jar
CPP_D=$(JAR)/jsonic-1.1.2.jar:/usr/local/lib/tokyocabinet.jar
CPP_E=$(CPP_A):$(CPP_B):$(CPP_C):$(CPP_D):$(REDIS_JAR)
CPP_F=$(CPP_E):/usr/share/java/jxl.jar
CPP_G=$(CPP_F):$(JAR)/commons-net-3.3.jar
CPP_I=$(CPP_G):$(LIB_CASSANDRA)/apache-cassandra-1.2.9.jar
CPP_J=$(CPP_I):$(LIB_CASSANDRA)/libthrift-0.7.0.jar
CPP_K=$(CPP_J):$(LIB_CASSANDRA)/log4j-1.2.16.jar:$(LIB_CASSANDRA)/slf4j-api-1.6.1.jar:$(LIB_CASSANDRA)/slf4j-log4j12-1.6.1.jar
CPP_L=$(CPP_K):$(VOLDEMORT)/dist/voldemort-0.90.jar
CPP_TIKA=./:$(TIKA):$(JAVA_COMMON)
CPP_EPUB=./:$(EPUB):$(JAVA_COMMON)
CPP_HGDB=./:$(HGDB_JAR):$(JAVA_COMMON)
CPP_CDB=./:$(SG_CDB):$(JAVA_COMMON):$(JAR)/jsonic-1.1.2.jar
CPP_XLSX=.:$(POI312)/poi-3.12-20150511.jar:$(POI312)/poi-ooxml-3.12-20150511.jar:$(POI312)/poi-ooxml-schemas-3.12-20150511.jar:$(POI312)/ooxml-lib/xmlbeans-2.3.0.jar
CPP_HBASE=`hbase classpath`
CPP_NET=./:$(HTTPCLIENT_JAR)
#
all: sql_manipulate.class xml_manipulate.class \
	text_manipulate.class \
	mcached_manipulate.class \
	ftp_manipulate.class \
	tika_manipulate.class \
	net_manipulate.class \
	excel_manipulate.class \
	epub_manipulate.class \
	mongo_manipulate.class \
	cassandra_manipulate.class \
	voldemort_manipulate.class \
	cdb_manipulate.class \
	hbase_manipulate.class \
	tcbn_manipulate.class \
	xlsx_manipulate.class \
	hgdb_manipulate.class
sql_manipulate.class: sql_manipulate.groovy
	groovyc sql_manipulate.groovy
xml_manipulate.class: xml_manipulate.groovy
	groovyc xml_manipulate.groovy
mcached_manipulate.class: mcached_manipulate.groovy
	groovyc mcached_manipulate.groovy
text_manipulate.class: text_manipulate.groovy
	groovyc -cp $(CPP_E) text_manipulate.groovy
excel_manipulate.class: excel_manipulate.groovy
	groovyc -cp $(CPP_F) excel_manipulate.groovy
cdb_manipulate.class: cdb_manipulate.groovy
	groovyc -cp $(CPP_CDB) cdb_manipulate.groovy
net_manipulate.class: net_manipulate.groovy
	groovyc -cp $(CPP_NET) net_manipulate.groovy
tcbn_manipulate.class: tcbn_manipulate.groovy
	groovyc -cp $(CPP_E) tcbn_manipulate.groovy
ftp_manipulate.class: ftp_manipulate.groovy
	groovyc -cp $(CPP_G) ftp_manipulate.groovy
hbase_manipulate.class: hbase_manipulate.groovy
	groovyc -cp $(CPP_HBASE) hbase_manipulate.groovy
voldemort_manipulate.class: voldemort_manipulate.groovy
	groovyc -cp $(CPP_L) voldemort_manipulate.groovy
cassandra_manipulate.class: cassandra_manipulate.groovy
	groovyc -cp $(CPP_K) cassandra_manipulate.groovy
tika_manipulate.class: tika_manipulate.groovy
	groovyc -cp $(CPP_TIKA) tika_manipulate.groovy
epub_manipulate.class: epub_manipulate.groovy
	groovyc -cp $(CPP_EPUB) epub_manipulate.groovy
hgdb_manipulate.class: hgdb_manipulate.groovy
	groovyc -cp $(CPP_HGDB) hgdb_manipulate.groovy
xlsx_manipulate.class: xlsx_manipulate.groovy
	groovyc -cp $(CPP_XLSX) xlsx_manipulate.groovy
mongo_manipulate.class: mongo_manipulate.groovy
	groovyc -cp $(MONGO_JAR) mongo_manipulate.groovy
html:
	cd html_src;make html
clean:
	rm -f *.class
