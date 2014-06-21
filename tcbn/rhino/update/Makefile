JAVA_COMMON=/var/www/data_base/common/java_common
CPP_A=/usr/local/lib/tokyocabinet.jar
CPP=$(CPP_A):$(JAVA_COMMON)
tcbn_update.class: tcbn_update.java
	javac -cp $(CPP) tcbn_update.java -Xlint:unchecked
clean:
	rm -f *.class
