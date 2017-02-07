GROOVY_COMMON=/var/www/data_base/common/groovy_common
USR_SHARE=/usr/share/java
CPP_A=$(USR_SHARE)/commons-httpclient-3.1.jar
CPP_B=$(USR_SHARE)/json-lib-2.3.jar
CPP_C=$(USR_SHARE)/commons-beanutils.jar
CPP_D=$(USR_SHARE)/commons-lang-2.4.jar
CPP_E=$(USR_SHARE)/ezmorph-1.0.6.jar
CPP_G=$(GROOVY_COMMON)
CPX=$(CPP_A):$(CPP_B):$(CPP_C):$(CPP_D):$(CPP_E):$(CPP_G)
webdav_create.class: webdav_create.groovy
	groovyc -cp $(CPX) webdav_create.groovy
clean:
	rm -f *.class
