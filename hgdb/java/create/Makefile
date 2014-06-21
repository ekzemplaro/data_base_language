JAVA_COMMON=/var/www/data_base/common/java_common
HGDB_JAR=/home/uchida/dbm/hgdb/hypergraphdb-1.1/hypergraphdb.jar
export CLASSPATH=./:$(HGDB_JAR):$(JAVA_COMMON)
hgdb_create.class: hgdb_create.java
	javac hgdb_create.java
clean:
	rm -f *.class
