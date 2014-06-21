GROOVY_COMMON=/var/www/data_base/common/groovy_common
HGDB_JAR=/home/uchida/dbm/hgdb/hypergraphdb-1.1/hypergraphdb.jar
export CLASSPATH=./:$(HGDB_JAR):$(GROOVY_COMMON)
hgdb_read.class: hgdb_read.groovy
	groovyc hgdb_read.groovy
clean:
	rm -f *.class
