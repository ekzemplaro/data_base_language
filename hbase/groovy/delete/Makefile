GROOVY_COMMON=/var/www/data_base/common/groovy_common
CP=./:$(GROOVY_COMMON):
hbase_delete.class: hbase_delete.groovy 
	groovyc -cp $(CP):`hbase classpath` hbase_delete.groovy
clean:
	rm -f *.class
