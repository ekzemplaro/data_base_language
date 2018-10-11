COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
CPATH=.:$(JAVA_COMMON)
json_delete.class: json_delete.java
	javac -cp $(CPATH) json_delete.java
clean:
	rm -f *.class
