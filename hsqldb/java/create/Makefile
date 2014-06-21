JAVA_COMMON=/var/www/data_base/common/java_common
CPX=.:$(JAVA_COMMON):/usr/share/java/hsqldb.jar
hsqldb_create.class: hsqldb_create.java
	javac -cp $(CPX) hsqldb_create.java
clean:
	rm -f *.class
