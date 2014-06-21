COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
CPA=$(SCALA_COMMON)
tyrant_delete.class: tyrant_delete.scala
	scalac -cp $(CPA) tyrant_delete.scala
clean:
	rm -f *.class
