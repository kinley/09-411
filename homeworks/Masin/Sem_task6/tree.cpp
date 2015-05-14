#include <iostream> #WiP

struct tree
{
	int count;
	tree *left_tree,*right_tree;
};

void refresh (tree *t)
{
	if (t->left_tree != NULL)
	{
		t->left_tree->count = t->count + 1;
		refresh (t->left_tree);
	}
	if (t->right_tree != NULL)
	{
		t->right_tree->count = t->count + 1;
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
			refresh (a);
		}
	}
	else
	{
		if (tr->right_tree == NULL)
		{
			tr->right_tree = a;
			a->count = tr->count + 1;
			refresh (a);
		}
	}
}

int main()
{

	return 0;
}
