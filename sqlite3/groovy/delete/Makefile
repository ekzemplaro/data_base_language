#
GROOVY_COMMON=/var/www/data_base/common/groovy_common
CPX=./:/usr/share/java/sqlite.jar:$(GROOVY_COMMON)
sqlite3_delete.class: sqlite3_delete.groovy
	groovyc -cp $(CPX) sqlite3_delete.groovy
clean:
	rm -f *.class
