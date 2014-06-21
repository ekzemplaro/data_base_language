CPX=/var/www/data_base/common/groovy_common:/usr/share/java/hsqldb.jar
hsqldb_create.class: hsqldb_create.groovy
	groovyc -cp $(CPX) hsqldb_create.groovy
clean:
	rm -f *.class
