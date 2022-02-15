
CCFLAGS = -g \
		-std=c++2a \
		-Wno-writable-strings \
		-Wno-deprecated \
		-Wno-c++11-compat-deprecated-writable-strings
CC = clang++ $(CCFLAGS)
OBJS = JackCompiler.o JackTokenizer.o LinkedList.o utils.o CompilationEngine.o 
FILES = JackCompiler.cpp JackTokenizer.cpp LinkedList.cpp utils.cpp CompilationEngine.cpp

JackCompiler : $(OBJS)
	$(CC) -o JackCompiler $(OBJS)
	

JackCompiler.o : JackCompiler.cpp CompilationEngine.o JackTokenizer.o utils.o 
	$(CC) -c JackCompiler.cpp

CompilationEngine.o : CompilationEngine.cpp JackTokenizer.o utils.o SymbolTable.hpp Symbol.hpp
	$(CC) -c CompilationEngine.cpp 

JackTokenizer.o : JackTokenizer.cpp LinkedList.o utils.o
	$(CC) -c JackTokenizer.cpp 

LinkedList.o : LinkedList.cpp utils.o 
	$(CC) -c LinkedList.cpp 

utils.o : utils.cpp	
	$(CC) -c utils.cpp	

.PHONY : clean
clean :
	rm $(OBJS) *.s 


.PHONY : test
test : tests.cpp Symbol.hpp SymbolTable.hpp 
	$(CC) -I/Users/kyle/include tests.cpp -o tests 
	./tests 