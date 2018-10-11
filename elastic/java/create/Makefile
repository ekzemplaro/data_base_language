COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
CPATH=.:$(JAVA_COMMON)
json_create.class: json_create.java
	javac -cp $(CPATH) json_create.java
clean:
	rm -f *.class
