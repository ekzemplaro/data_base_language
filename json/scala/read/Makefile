SCALA_COMMON=/var/www/data_base/common/scala_common
CPX=./:json4s-core_2.11-3.2.10.jar:json4s-native_2.11-3.2.10.jar:json4s-ast_2.11-3.2.10.jar:$(SCALA_COMMON)
json_read.class: json_read.scala
	scalac -cp $(CPX) json_read.scala
clean:
	rm -f *.class
