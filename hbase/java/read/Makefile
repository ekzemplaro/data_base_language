#
# export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre
# export PATH=$PATH:/home/uchida/dbm/hbase/hbase-0.96.0-hadoop2/bin
#
JAVA_COMMON=/var/www/data_base/common/java_common
hbase_read.class: hbase_read.java 
	javac -cp `hbase classpath`:$(JAVA_COMMON) hbase_read.java -Xlint:deprecation
clean:
	rm -f *.class
