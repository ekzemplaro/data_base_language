COMMON=/var/www/data_base/common
GROOVY_COMMON=$(COMMON)/groovy_common
JAR=$(COMMON)/jar
MONGO_JAR=$(JAR)/mongo-java-driver-3.0.3.jar
CPX=$(MONGO_JAR):$(GROOVY_COMMON)
mongo_read.class: mongo_read.groovy
	groovyc -cp $(CPX) mongo_read.groovy
clean:
	rm -f *.class
