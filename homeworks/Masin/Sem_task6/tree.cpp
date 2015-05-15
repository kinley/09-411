#include <iostream> //Wip

struct tree
{
	int count;
	std::string key;
	tree *left_tree,*right_tree;
};

void refresh (tree *t)
{
	if (t->left_tree != NULL)
	{
		t->left_tree->count = t->count + 1;
		t->left_tree->key = t->key + "0";
		refresh (t->left_tree);
	}
	if (t->right_tree != NULL)
	{
		t->right_tree->count = t->count + 1;
		t->right_tree->key = t->key + "1";
		refresh (t->right_tree);
	}
}

void add_tree (tree *tr,tree *a, int w)
{
	if (w == 0)
	{
		if (tr->left_tree == NULL)
		{
			tr->left_tree = a;
			a->count = tr->count + 1;
			a->key = tr->key + "0";
			refresh (a);
		}
	}
	else
	{
		if (tr->right_tree == NULL)
		{
			tr->right_tree = a;
			a->count = tr->count + 1;
			a->key = tr->key + "1";
			refresh (a);
		}
	}
}

tree* find_by_key(tree *tr, std::string keyword)
{
	int i=1;
	tree *temp_t = tr;
	if (keyword == "0" )
	{
		return temp_t;
	}	
	else
	{
		while (i<keyword.size())
		{
			if(keyword[i]=="0")
			{
				if (temp_t->left_tree == NULL)
				{
					return NULL;
				}
				temp_t = temp_t->left_tree;
			}
			else
			{
				if (temp_t->right_tree == NULL)
				{
					return NULL;
				}
				temp_t = temp_t->right_tree;
			}
			i++;
		}
		return temp_t;		
	}
}

int main()
{
	return 0;
}
