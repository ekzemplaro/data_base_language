COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JSON4S=$(COMMON)/jar/json4s
CPX=./:$(JSON4S)/json4s-core_2.11-3.2.11.jar:$(JSON4S)/json4s-native_2.11-3.2.11.jar:$(JSON4S)/json4s-ast_2.11-3.2.11.jar:$(SCALA_COMMON)
json_read.class: json_read.scala
	scalac -cp $(CPX) json_read.scala
clean:
	rm -f *.class
