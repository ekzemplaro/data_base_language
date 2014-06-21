JAVA_COMMON=/var/www/data_base/common/java_common
hbase_delete.class: hbase_delete.java 
	javac -cp `hbase classpath`:$(JAVA_COMMON) hbase_delete.java -Xlint:deprecation
clean:
	rm -f *.class
