#include "my_stack.h"
using namespace std;
int main()
{
	My_Stack stack1( 3 );
	stack1.push( 1 );
	stack1.push( 2 );
	stack1.push( 3 );
	stack1.push( 4 );
	cout << "Stack capacity is: " << stack1.capacity() << endl;
	cout << "Trying push function:" << endl;
	stack1.printStack();
	cout << "Trying pop function:" << endl;
	stack1.pop();
	stack1.printStack();
	cout << "Top of stack is: " << stack1.top() << endl;
	cout << "Is stack empty?: " << " " << ( (stack1.empty() == 1)? "true":"false") << endl;
	cout << "Stack size is: " << stack1.size() << endl;
//	cout << "Stack capacity is: " << stack1.capacity() << endl;
	return 0;
}
