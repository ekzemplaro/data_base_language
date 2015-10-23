SCALA_COMMON=/var/www/data_base/common/scala_common
CPP_A=/usr/local/lib/tokyocabinet.jar
CPP=$(CPP_A):$(SCALA_COMMON)
tcbn_delete.class: tcbn_delete.scala
	scalac -cp $(CPP) tcbn_delete.scala
clean:
	rm -f *.class
