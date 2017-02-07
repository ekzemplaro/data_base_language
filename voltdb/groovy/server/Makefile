export CLASSPATH=.:/home/uchida/dbm/voltdb/voltdb-1.3.4/voltdb/*
helloworld.jar : Insert.class Select.class
	java org.voltdb.compiler.VoltCompiler project.xml helloworld.jar 
Insert.class : Insert.java
	javac Insert.java
Select.class : Select.java
	javac Select.java
clean:
	rm -f *.jar *.class
