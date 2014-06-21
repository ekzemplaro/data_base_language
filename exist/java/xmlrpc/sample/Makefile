EXIST_HOME=/home/uchida/eXist
L_CORE=$(EXIST_HOME)/lib/core
CPP_A=.:$(EXIST_HOME)/exist.jar:$(L_CORE)/xmldb.jar:$(L_CORE)/log4j-1.2.15.jar
CPP_B=$(CPP_A):$(L_CORE)/xmlrpc-client-3.1.2.jar:$(L_CORE)/xmlrpc-common-3.1.2.jar
CPP=$(CPP_B):$(L_CORE)/ws-commons-util-1.0.2.jar
PingClient.class :  PingClient.java
	javac -cp $(CPP) PingClient.java
clean:
	rm -f *.class
