#include "SkipList.h"
#include <string>
#include <iostream>
using namespace std;

void main(){
	SkipList *goodBoys = new SkipList();
	goodBoys->readFile("C://Users//user//Desktop//goodBoys.txt");
	SkipList *badBoys = new SkipList();
	badBoys->readFile("C://Users//user//Desktop//badBoys.txt");

	char command;
	char *name = new char[];
	while (true){
		cout << "Enter command(F, U, E, S): "; // F - голосовал "првильно", U - голосовал "не првильно" 
		cin >> command;						   // E - проверить в каком списке, S - прекратить ввод команд
		if (command == 'S'){
			cout << "End enter command";
			break;
		}
		cout << endl << "Enter name: ";
		cin >> name;
		goodBoys->readCommand(command, name, goodBoys, badBoys);
	}
}