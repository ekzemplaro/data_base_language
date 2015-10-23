#
GROOVY_COMMON=/var/www/data_base/common/groovy_common
CPX=./:/usr/share/java/sqlite.jar:$(GROOVY_COMMON)
sqlite3_update.class: sqlite3_update.groovy
	groovyc -cp $(CPX) sqlite3_update.groovy
clean:
	rm -f *.class
