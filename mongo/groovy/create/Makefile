COMMON=/var/www/data_base/common
JAR=$(COMMON)/jar
MONGO_JAR=$(JAR)/mongo-java-driver-3.0.3.jar
mongo_create.class: mongo_create.groovy
	groovyc -cp $(MONGO_JAR) mongo_create.groovy
clean:
	rm -f *.class
