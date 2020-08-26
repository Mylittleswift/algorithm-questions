/***
 99. Recover Binary Search Tree
 Hard

 Two elements of a binary search tree (BST) are swapped by mistake.
 
 Recover the tree without changing its structure.
 
 Example 1:
 
 Input: [1,3,null,null,2]
 
 1
 /
 3
 \
 2
 
 Output: [3,1,null,null,2]
 
 3
 /
 1
 \
 2
 Example 2:
 
 Input: [3,1,4,null,null,2]
 
 3
 / \
 1   4
 /
 2
 
 Output: [2,1,4,null,null,3]
 
 2
 / \
 1   4
 /
 3
 Follow up:
 
 A solution using O(n) space is pretty straight forward.
 Could you devise a constant space solution?
 ***/




class Solution99x1 {
    var biggerNode: TreeNode? = nil
    var smallerNode: TreeNode? = nil
    var node = TreeNode(-10000)
    
    func inorderTraverse(_ root: TreeNode) {
        
        if root.left != nil {
            inorderTraverse(root.left!)
        }
        
        if biggerNode == nil && root.val <= node.val {
            biggerNode = node
        }
        if root.val <= node.val {
            smallerNode = root
        }
        node = root
        
        if root.right != nil {
            inorderTraverse(root.right!)
        }
        
    }
    func recoverTree(_ root: TreeNode?) {
        guard let root = root else { return }
        inorderTraverse(root)
        let num = smallerNode!.val
        smallerNode?.val = (biggerNode?.val)!
        biggerNode?.val = num
    }
}



class Solution99x2 {
    func recoverTree(_ root: TreeNode?) {
        var firstElement: TreeNode? = nil
        var secondElement: TreeNode? = nil
        var prevElement = TreeNode(Int.min)
        
        traverse(root, &firstElement, &secondElement, &prevElement)
        
        let temp = firstElement?.val
        firstElement?.val = secondElement?.val ?? 0
        secondElement?.val = temp ?? 0
    }
    
    fileprivate func traverse(_ root: TreeNode?, _ firstElement: inout TreeNode?, _ secondElement: inout TreeNode?, _ prevElement: inout TreeNode) {
        guard let root = root else { return }
        
        traverse(root.left, &firstElement, &secondElement, &prevElement)
        
        if firstElement == nil && prevElement.val >= root.val {
            firstElement = prevElement
        }
        if firstElement != nil && prevElement.val >= root.val {
            secondElement = root
        }
        prevElement = root
        
        traverse(root.right, &firstElement, &secondElement, &prevElement)
    }
}



class Solution99x3 {
    var first: TreeNode?
    var second: TreeNode?
    var prev = TreeNode(Int.min)
    
    func recoverTree(_ root: TreeNode?) {
        traverse(root)
        
        let temp = first!.val
        first!.val = second!.val
        second!.val = temp
    }
    
    func traverse(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        traverse(root?.left)
        
        if first == nil && prev.val >= root!.val {
            first = prev
        }
        
        if first != nil && prev.val >= root!.val {
            second = root
        }
        prev = root!
        
        traverse(root?.right)
    }
}


