#include <iostream>
#include <cstring>
#include "my_stack.h"
using namespace std;

My_Stack::My_Stack()
{
	max_elem = 1;
	last = 0;
	data = new int[ max_elem ];
}
My_Stack::My_Stack( int n )
{
	max_elem = n;
	last = 0;
	data = new int[ max_elem ];
}
My_Stack::~My_Stack()
{
	delete [] data;
}
int My_Stack::top()
{
	return ((last) ? data[ last -1 ] : -1 );
}
void My_Stack::push( int a )
{
	if( last < max_elem )
	{
		data[ last++ ] = a;
	}
	else
	{
		int *new_data = new int[ max_elem ];
		memcpy( new_data, data, max_elem * sizeof( int ) );
		delete [] data;
		
		max_elem *= 2;
		int *data = new int[ max_elem ];
		memcpy( data, new_data, max_elem * sizeof( int ) );
		data[ last++ ] = a;
	}
}
void My_Stack::pop()
{
	if( last )
	{
		last--;
	}
}
int My_Stack::size() 
{
	return --last;
}
int My_Stack::capacity()
{
	return max_elem;
}
bool My_Stack::empty() const
{
	return !last;
}
void My_Stack::printStack() const
{
	for( int i = 0; i < last; i++ )
	{
		cout << data[ i ] << " ";
	}
	cout << endl;
}



