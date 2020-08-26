/***
 104. Maximum Depth of Binary Tree
 Easy

 Given a binary tree, find its maximum depth.
 
 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Given binary tree [3,9,20,null,null,15,7],
 
 3
 / \
 9  20
 /  \
 15   7
 return its depth = 3.
 ***/



class Solution104x1 {
    func maxDepth(_ root: TreeNode?) -> Int {
        //将树分为左子树和右子树两部分，左右子树中深度最大的即为该树结构的深度。
        var max:Int = 0
        if root != nil
        {
            max += 1
            var maxLeft:Int = maxDepth(root!.left)
            var maxRight:Int = maxDepth(root!.right)
            max += (maxLeft > maxRight ? maxLeft : maxRight)
        }
        return max
    }
}



class Solution104x2 {
    
    func maxDepth(_ root: TreeNode?) -> Int {
        
        guard let node = root else {
            return 0
        }
        
        return 1 + max(maxDepth(node.left), maxDepth(node.right))
        
    }
}



class Solution104x3 {
    
    func maxDepth(_ root: TreeNode?) -> Int {
        
        guard let node = root else {
            return 0
        }
        
        var depth: Int = 0
        var stack: [TreeNode] = [node]
        
        while !stack.isEmpty {
            
            var currentStackSize = stack.count
            
            while currentStackSize > 0 {
                
                let lastNode = stack.popLast()!
                
                if let last = lastNode.left {
                    stack.insert(last, at: 0)
                }
                
                if let right = lastNode.right {
                    stack.insert(right, at: 0)
                }
                
                currentStackSize -= 1
            }
            
            depth += 1
        }
        
        return depth
    }
}
