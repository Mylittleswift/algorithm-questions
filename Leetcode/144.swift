/***
 144. Binary Tree Preorder Traversal
 Medium

 Given a binary tree, return the preorder traversal of its nodes' values.
 
 Example:
 
 Input: [1,null,2,3]
 1
 \
 2
 /
 3
 
 Output: [1,2,3]
 Follow up: Recursive solution is trivial, could you do it iteratively?
 ***/




class Solution144x1 {
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var stack = [root]
        var processed = [Int]()
        
        while let node = stack.popLast() {
            processed.append(node.val)
            
            if let right = node.right {
                stack.append(right)
            }
            
            if let left = node.left {
                stack.append(left)
            }
        }
        
        return processed
    }
    
}



class Solution144x2 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if (root == nil) {
            return Array()
        }
        
        var res : [Int] = [Int]()
        var stack : [TreeNode] = [TreeNode]()
        stack.append(root!)
        while(stack.count > 0) {
            let node : TreeNode = stack.last!
            stack.removeLast()
            if (node.right != nil) {
                stack.append(node.right!)
            }
            if (node.left != nil) {
                stack.append(node.left!)
            }
            res.append(node.val)
        }
        
        return res
    }
}



class Solution144x3 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        var stack = [TreeNode]()
        var node = root
        while(stack.count > 0 || node != nil) {
            if node != nil {
                stack.append(node!)
                res.append(node!.val)
                node = node!.left
            }
            else {
                node = stack.removeLast().right
            }
        }
        return res
    }
}


class Solution144X4 {
    var result = [Int]()
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return result
        }
        result.append(root.val)
        preorderTraversal (root.left)
        preorderTraversal (root.right)
        
        return result
    }
}
