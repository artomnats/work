#ifndef MY_STACK_H
#define MY_STACK_H
#include <iostream>
using namespace std;

class My_Stack
{
public:
	My_Stack();
	My_Stack( int  );
	~My_Stack();
	int top();
	void pop();
	void push( int );
	int size();
	int capacity();
	bool empty() const;
	void printStack() const;
private:
	int max_elem;
	int last;
	int *data;
};

#endif

