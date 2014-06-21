JAVA_COMMON=/var/www/data_base/common/java_common
hbase_update.class: hbase_update.java 
	javac -cp `hbase classpath`:$(JAVA_COMMON) hbase_update.java -Xlint:deprecation
clean:
	rm -f *.class
