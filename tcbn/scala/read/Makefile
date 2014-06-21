SCALA_COMMON=/var/www/data_base/common/scala_common
CPP_A=/usr/local/lib/tokyocabinet.jar
CPP=$(CPP_A):$(SCALA_COMMON)
tcbn_read.class: tcbn_read.scala
	scalac -cp $(CPP) tcbn_read.scala
clean:
	rm -f *.class
