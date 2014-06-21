JAVA_COMMON=/var/www/data_base/common/java_common
CPX=.:$(JAVA_COMMON):/usr/share/java/hsqldb.jar
hsqldb_update.class: hsqldb_update.java
	javac -cp $(CPX) hsqldb_update.java
clean:
	rm -f *.class
