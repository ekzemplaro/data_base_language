GROOVY_COMMON=/var/www/data_base/common/groovy_common

CP=./:$(GROOVY_COMMON):
hbase_update.class: hbase_update.groovy 
	groovyc -cp $(CP):`hbase classpath` hbase_update.groovy
clean:
	rm -f *.class
