COMMON=/var/www/data_base/common
SCALA_COMMON=$(COMMON)/scala_common
JAR=$(COMMON)/jar
export USR_SHARE=/usr/share/java
CPA=$(SCALA_COMMON)
tyrant_read.class: tyrant_read.scala
	scalac -cp $(CPA) tyrant_read.scala
clean:
	rm -f *.class
