CPP_A=/usr/local/lib/tokyocabinet.jar
CPP=$(CPP_A):/var/www/data_base/common/java_common
tcbn_read.class: tcbn_read.java
	javac -cp $(CPP) tcbn_read.java -Xlint:unchecked
clean:
	rm -f *.class
