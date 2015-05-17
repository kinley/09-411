unit instruments;
interface
  type
    tVal = record
              nodes: set of integer;
              weight: integer;
             end;
    pNode = ^tNode;
    tLeast = record //record of the least element in subtree
              value: tVal;
              child: pNode; //pointer to the corresponding subtree
             end;
    tNode = record //the records of internal nodes and leaves are the same
              least: tLeast; //least element in subtree
              left, middle, right: pNode; //pointers to children
              value: tVal; //element in leaf
            end;
    tTree = record //tree record
              root: pNode;
              depth: integer;
            end;
  
  const
    zeroVal: tVal = (nodes: []; weight: 0);
  
  procedure createTree(var tree: tTree);
  //procedure destroyTree(var tree: tTree); TODO
  
  function min(tree: tTree): tVal;
  procedure insert(leaf: pNode; var tree: tTree);
  
implementation
  uses myList, queue;
  
  procedure createTree;
    var
      p: pNode;
    
  Begin
    new(p);
    with p^ do
      begin
        least.value := zeroVal;
        least.child := nil;
        left := nil;
        middle := nil;
        right := nil;
        value := zeroVal;
      end;
    tree.root := p;
    tree.depth := 0;
  End;
  
  {procedure destroyTree;
  Begin
    TODO
  End;}
  
  
  function initNode(l: tLeast): pNode; //initialization of node; fills only a "least" field
    var
      p: pNode;
    
  Begin
    new(p);
    with p^ do
      begin
        least := l;
        left := nil;
        middle := nil;
        right := nil;
        value := zeroVal;
      end;
    result := p;
  End;
  
  function initLeaf(v: tVal): pNode; //initialization of leaf; fills only a "value" field
    var
      p: pNode;
    
  Begin
    new(p);
    with p^ do
      begin
        least.value := zeroVal;
        least.child := nil;
        left := nil;
        middle := nil;
        right := nil;
        value := v;
      end;
    result := p;
  End;
  
  function getLeast(node: tNode): tLeast;
  Begin
    result := node.least;
  End;
  
  function parent(node: pNode, tree: tTree): pNode; //TODO; breadth-first search
    var
      p: pNode;
      q: tQueue;
    
  Begin
    p := tree.root;
    createQueue(q);
    enqueue(
    with p^ do
      while (left <> node) and (middle <> node) and (right <> node) and (value <> zeroVal) do
        begin
          //TODO
        end;
    destroy(curr);
    destroy(next);
    result := p;
  End;
  
  //procedure addSon
  
  function min: tVal; //moves through the tree, passing through the nodes, whose subtrees' leaf stores the smallest value
    var
      currNode: pNode;
  
  Begin
    currNode := tree.root;
    while currNode^.value = zeroVal do
      begin
        currNode := getLeast(currNode^).child;
      end;
    result := currNode^.value;
  End;
  
  procedure insert;
    var
      l: tLeast;
      p: pNode;
    
  Begin
    with tree do
      if root^.left = nil then
                            begin
                              l.value := leaf^.value;
                              l.child := leaf;
                              root^.left := initNode(l);
                              root^.left^.left := leaf;
                            end
                          else if root^.left^.middle = nil then root^.left^.middle := leaf
                                                           else if root^.left^.right = nil then root^.left^.right := leaf
                                                                                           else addSon //TODO
  End;
  
END.