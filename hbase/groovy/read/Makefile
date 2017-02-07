GROOVY_COMMON=/var/www/data_base/common/groovy_common

CP=./:$(GROOVY_COMMON):
hbase_read.class: hbase_read.groovy 
	groovyc -cp $(CP):`hbase classpath` hbase_read.groovy
clean:
	rm -f *.class
