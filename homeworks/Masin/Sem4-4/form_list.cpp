#include <iostream>
#include <fstream>
#include <string> 
#include "list_implementation.cpp"

int form_list(char *l,list *l_list)
{
	std::ifstream file(l);
	std::string str,str1;

	char c;
	int t=0,d=0,i=0;
	bool flag=true;
	while (file.get(c)&&flag)
	{
		switch (c)
		{
		case ',':
			flag=false;
			d=file.tellg(); 
			break;
		case ' ': break;	 
		default: 
			str.append(1,c); 
			break;	
		}
	}


    file.seekg(d);
    t = std::stoi(str);
    node *p = new node;
	create_node(0,t,0,p);
	push(l_list,p);
	str.clear();

	while (file.get(c))
	{
		switch (c)
		{
		case ',':
			if(flag==false)
			{ t = std::stoi(str); i++;}
			else
			{ d = std::stoi(str1); i++;}
			if((t!=0 || d!=0)&& i%2==0)
			{
				node *p = new node;
				create_node(i/2,t,d,p);
				push(l_list,p);
				str.clear();
				str1.clear();
			} 
			flag=!flag;
			break;
		case ' ': break;	 
		default:
			if(flag==false)
			{str.append(1,c); }
			else
			{str1.append(1,c);} 
			break;	
		}
	}

	i++;
	if(flag==false)
	{
		t = std::stoi(str);
	    str.append(1,c);
	    node *p = new node;
		create_node(i/2,t,d,p);
		push(l_list,p); 
	}
	else
	{
		d = std::stoi(str1);
		str1.append(1,c);
		node *p = new node;
		create_node(i/2,t,d,p);
		push(l_list,p);
	}
	
	file.close();
	return t;
}

int num_of_elem(char *l)
{
	std::ifstream file(l);
	char c;
	int cout;
	while (file.get(c))
	{
		if (c==',')
			cout++;
	}
	file.close();
	return cout+1;
}
/*
int main()
{
	return 0;
}*/
