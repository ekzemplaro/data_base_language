COMMON=/var/www/data_base/common
JAVA_COMMON=$(COMMON)/java_common
JAR=$(COMMON)/jar
CPATH=.:$(JAVA_COMMON)
json_update.class: json_update.java
	javac -cp $(CPATH) json_update.java
clean:
	rm -f *.class
