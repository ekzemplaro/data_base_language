GROOVY_COMMON=/var/www/data_base/common/groovy_common
export USR_SHARE=/usr/share/java
CPP_A=$(USR_SHARE)/commons-httpclient-3.1.jar:$(USR_SHARE)/json-lib-2.3.jar
CPP_C=$(GROOVY_COMMON)
CPX=$(CPP_A):$(CPP_C)
webdav_delete.class: webdav_delete.groovy
	groovyc -cp $(CPX) webdav_delete.groovy
clean:
	rm -f *.class
