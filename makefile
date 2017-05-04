My_stack: main.o my_stack.o
	g++ main.o my_stack.o -o My_stack

main.o: main.o my_stack.h
	g++ -c main.cpp

my_stack.o: my_stack.cpp my_stack.h
	g++ -c my_stack.cpp
