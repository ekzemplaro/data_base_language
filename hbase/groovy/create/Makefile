GROOVY_COMMON=/var/www/data_base/common/groovy_common

CP=./:$(GROOVY_COMMON):
hbase_create.class: hbase_create.groovy 
	groovyc -cp $(CP):`hbase classpath` hbase_create.groovy
clean:
	rm -f *.class
