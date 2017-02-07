JAVA_COMMON=/var/www/data_base/common/java_common
HGDB_JAR=/home/uchida/dbm/hgdb/hypergraphdb-1.1/hypergraphdb.jar
export CLASSPATH=./:$(HGDB_JAR):$(JAVA_COMMON)
hgdb_read.class: hgdb_read.java
	javac hgdb_read.java
clean:
	rm -f *.class
