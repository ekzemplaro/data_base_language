COMMON=/var/www/data_base/common
JAR=$(COMMON)/jar
GROOVY_COMMON=$(COMMON)/groovy_common
MONGO_JAR=$(JAR)/mongo-2.8.0.jar
CPX=$(MONGO_JAR):$(GROOVY_COMMON)
mongo_delete.class: mongo_delete.groovy
	groovyc -cp $(CPX) mongo_delete.groovy
clean:
	rm -f *.class
