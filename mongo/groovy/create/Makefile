COMMON=/var/www/data_base/common
JAR=$(COMMON)/jar
MONGO_JAR=$(JAR)/mongo-2.8.0.jar
mongo_create.class: mongo_create.groovy
	groovyc -cp $(MONGO_JAR) mongo_create.groovy
clean:
	rm -f *.class
