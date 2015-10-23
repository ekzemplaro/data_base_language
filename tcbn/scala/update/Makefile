SCALA_COMMON=/var/www/data_base/common/scala_common
CPP_A=/usr/local/lib/tokyocabinet.jar
CPP=$(CPP_A):$(SCALA_COMMON)
tcbn_update.class: tcbn_update.scala
	scalac -cp $(CPP) tcbn_update.scala
clean:
	rm -f *.class
