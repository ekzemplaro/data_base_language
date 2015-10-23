GROOVY_COMMON=/var/www/data_base/common/groovy_common
HGDB_JAR=/home/uchida/dbm/hgdb/hypergraphdb-1.1/hypergraphdb.jar
export CLASSPATH=./:$(HGDB_JAR):$(GROOVY_COMMON)
hgdb_update.class: hgdb_update.groovy
	groovyc hgdb_update.groovy
clean:
	rm -f *.class
