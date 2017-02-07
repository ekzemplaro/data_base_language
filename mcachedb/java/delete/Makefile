COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
CPP=./:$(JAVA_COMMON)
mcachedb_delete.class: mcachedb_delete.java
	javac -cp $(CPP) mcachedb_delete.java -Xlint:unchecked
clean:
	rm -f *.class
