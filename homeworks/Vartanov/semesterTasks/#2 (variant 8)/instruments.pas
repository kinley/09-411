unit instruments;
interface
  const
    zeroValue = 0;
  
  type
    tValue = integer; //element in leaf
    pNode = ^tNode; 
    tLeast = record //record of the least element in subtree
              value: tValue;
              child: pNode; //pointer to the corresponding subtree
             end;
    tNode = record //for internal nodes and leaves a record is the same
              least: tLeast; //least element in subtree
              left, middle, right: pNode; //pointers to childrens
              value: tValue;
            end;
    tTree = record //tree record
              root: pNode;
              depth: integer;
            end;
  
  procedure createTree(var tree: tTree);
  //procedure destroyTree(var tree: tTree);
  
  function initNode(l: tLeast): pNode; //initialization of node
  function initLeaf(v: tValue): pNode; //initialization of leaf
  
  function getLeast(node: tNode): tLeast;
  
  procedure min(tree: tTree; var m: tValue);

implementation
  procedure createTree;
    var
      p: pNode;
    
  Begin
    new(p);
    p^.least.value := zeroValue;
    p^.least.son := nil;
    p^.left := nil;
    p^.middle := nil;
    p^.right := nil;
    p^.value := zeroValue;
    tree.root := p;
    tree.depth := 0;
  End;
  
  {procedure destroyTree;
  Begin
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  End;}
  
  
  function initNode: pNode; //fills only a "least" field
    var
      p: pNode;
    
  Begin
    new(p);
    p^.least := l;
    p^.left := nil;
    p^.middle := nil;
    p^.right := nil;
    p^.value := zeroValue;
    result := p;
  End;
  
  function initLeaf: pNode; //fills only a "value" field
    var
      p: pNode;
    
  Begin
    new(p);
    p^.least.value := zeroValue;
    p^.least.son := nil;
    p^.left := nil;
    p^.middle := nil;
    p^.right := nil;
    p^.value := v;
    result := p;
  End;
  
  function getLeast: tLeast;
  Begin
    result := node.least;
  End;
  
  procedure min; //moving the tree, going to the nodes in the subtree which are stored the least value
    var
      currNode: pNode;
  
  Begin
    currNode := tree.root;
    while currNode^.value = zeroValue do
      begin
        currNode := getLeast(currNode^).child;
      end;
    m := currNode^.value;
  End;
  
END.