JAVA_COMMON=/var/www/data_base/common/java_common
CPP_A=/usr/local/lib/tokyocabinet.jar
CPP=$(CPP_A):$(JAVA_COMMON)
tcbn_delete.class: tcbn_delete.java
	javac -cp $(CPP) tcbn_delete.java -Xlint:unchecked
clean:
	rm -f *.class
