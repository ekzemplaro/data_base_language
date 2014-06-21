SCALA_COMMON=/var/www/data_base/common/scala_common
CPP_A=/usr/local/lib/tokyocabinet.jar
CPP=$(CPP_A):$(SCALA_COMMON)
tcbn_create.class: tcbn_create.scala
	scalac -cp $(CPP) tcbn_create.scala
clean:
	rm -f *.class
