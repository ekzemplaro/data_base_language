EXIST_HOME=/home/uchida/eXist
L_CORE=$(EXIST_HOME)/lib/core
CPP_A=.:$(EXIST_HOME)/exist.jar:$(L_CORE)/xmldb.jar:$(L_CORE)/log4j-1.2.15.jar
CPP_B=$(CPP_A):$(L_CORE)/xmlrpc-client-3.1.2.jar:$(L_CORE)/xmlrpc-common-3.1.2.jar
CPP_C=$(CPP_B):$(L_CORE)/ws-commons-util-1.0.2.jar
CPP_D=$(CPP_C):/usr/share/java/commons-httpclient-3.1.jar
CPP=$(CPP_D):/var/www/data_base/common/java_common
basex_create.class :  basex_create.java
	javac -cp $(CPP) basex_create.java
clean:
	rm -f *.class
