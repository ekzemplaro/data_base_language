COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPP=./:$(JAVA_COMMON)
mcached_delete.class: mcached_delete.java
	javac -encoding UTF-8 -cp $(CPP) mcached_delete.java -Xlint:unchecked
clean:
	rm -f *.class
