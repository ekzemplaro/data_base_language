JAVA_COMMON=/var/www/data_base/common/java_common
CPX=.:$(JAVA_COMMON):/usr/share/java/hsqldb.jar
hsqldb_read.class: hsqldb_read.java
	javac -cp $(CPX) hsqldb_read.java
clean:
	rm -f *.class
