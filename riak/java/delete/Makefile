COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
riak_delete.class: riak_delete.java
	javac -cp $(JAVA_COMMON) riak_delete.java -Xlint:unchecked
clean:
	rm -f *.class
