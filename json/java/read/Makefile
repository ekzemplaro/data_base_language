COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
CPATH=.:$(JAVA_COMMON)
json_read.class: json_read.java
	javac -cp $(CPATH) json_read.java
clean:
	rm -f *.class
