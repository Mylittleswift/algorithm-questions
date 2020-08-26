/***
173. Binary Search Tree Iterator
Medium

Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.

Calling next() will return the next smallest number in the BST.



Example:



BSTIterator iterator = new BSTIterator(root);
iterator.next();    // return 3
iterator.next();    // return 7
iterator.hasNext(); // return true
iterator.next();    // return 9
iterator.hasNext(); // return true
iterator.next();    // return 15
iterator.hasNext(); // return true
iterator.next();    // return 20
iterator.hasNext(); // return false


Note:

next() and hasNext() should run in average O(1) time and uses O(h) memory, where h is the height of the tree.
You may assume that next() call will always be valid, that is, there will be at least a next smallest number in the BST when next() is called.
***/




class BSTIterator {
    
    //we need a storage to store the values
    //let's define an array
    private var storage = [Int]()
    
    //we also need a counter to run the iterator
    private var counter = -1
    
    //we need to traverse in an inorder fashion and store the elements
    //in the storage
    private func traverseInorder(_ root: TreeNode?) {
        if root == nil { return }
        traverseInorder(root!.left)
        storage.append(root!.val)
        traverseInorder(root!.right)
    }
    
    init(_ root: TreeNode?) {
        traverseInorder(root)
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        if hasNext() {
            counter += 1
            return storage[counter]
        }
        return -1
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        if counter < storage.count - 1{
            return true
        }
        return false
    }
}




class BSTIterator2 {
    
    private var stack = [TreeNode]()
    
    // MARK: - Initialization
    
    init(_ root: TreeNode?) {
        var curr = root
        while let node = curr {
            stack.append(node)
            curr = node.left
        }
    }
    
    // MARK: - Iterator methods
    
    func next() -> Int {
        guard let node = stack.popLast() else { fatalError("No values to iterate over") }
        var curr = node.right
        while let new = curr {
            stack.append(new)
            curr = new.left
        }
        
        return node.val
    }
    
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
