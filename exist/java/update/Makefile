EXIST_HOME=/home/uchida/eXist
L_CORE=$(EXIST_HOME)/lib/core
CPP_A=.:$(EXIST_HOME)/exist.jar:$(L_CORE)/xmldb.jar:$(L_CORE)/log4j-1.2.15.jar
CPP_C=$(L_CORE)/ws-commons-util-1.0.2.jar
CPP=$(CPP_C):/var/www/data_base/common/java_common
exist_update.class :  exist_update.java
	javac -cp $(CPP) exist_update.java
clean:
	rm -f *.class
