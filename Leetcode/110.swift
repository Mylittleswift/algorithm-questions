/***
 110. Balanced Binary Tree
 Easy

 Given a binary tree, determine if it is height-balanced.
 
 For this problem, a height-balanced binary tree is defined as:
 
 a binary tree in which the left and right subtrees of every node differ in height by no more than 1.
 
 
 
 Example 1:
 
 Given the following tree [3,9,20,null,null,15,7]:
 
 3
 / \
 9  20
 /  \
 15   7
 Return true.
 
 Example 2:
 
 Given the following tree [1,2,2,3,3,null,null,4,4]:
 
 1
 / \
 2   2
 / \
 3   3
 / \
 4   4
 Return false.
 ***/




class Solution110x1 {
    func isBalanced(_ root: TreeNode?) -> Bool {
        //递归分治法
        if root == nil {return true}
        
        var depthLeft:Int = depth(root?.left)
        var depthRight:Int = depth(root?.right)
        if abs(depthLeft-depthRight) > 1
        {
            return false
        }
        else
        {
            return isBalanced(root?.left) && isBalanced(root?.right)
        }
    }
    //求树的高度
    func depth(_ n:TreeNode?)->Int
    {
        if n==nil
        {
            return 0
        }
        else if n?.left == nil && n?.right == nil
        {
            return 1
        }
        else
        {
            var depthLeft:Int = depth(n?.left)
            var depthRight:Int = depth(n?.right)
            return (1 + ((depthLeft > depthRight) ? depthLeft : depthRight))
        }
    }
}



class Solution110x2 {
    
    //     func isBalanced(_ root: TreeNode?) -> Bool {
    //         guard let root = root else {
    //             return true
    //         }
    //         if abs(getDepth(root.left) - getDepth(root.right)) > 1 {
    //             return false
    //         }
    //         return isBalanced(root.left) && isBalanced(root.right)
    //     }
    
    //     func getDepth(_ root: TreeNode?) -> Int {
    //         if root == nil {
    //             return 0
    //         }
    //         return max(getDepth(root!.left), getDepth(root!.right)) + 1
    //     }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        if checkDepth(root) == -1 {
            return false
        }
        return true
    }
    
    func checkDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let left = checkDepth(root.left)
        if left == -1 {
            return -1
        }
        
        let right = checkDepth(root.right)
        if right == -1 {
            return -1
        }
        
        if abs(left - right) > 1 {
            return -1
        }
        
        return max(left, right) + 1
    }
}



class Solution110x3 {
    func isBalanced(_ root: TreeNode?) -> Bool {
        var result = true
        isBalanced(root, &result)
        return result
    }
    
    func isBalanced(_ root: TreeNode?, _ result: inout Bool) -> Int {
        guard let root = root else {
            return 0
        }
        
        guard result else {
            return 0
        }
        
        let leftHeight = isBalanced(root.left, &result)
        let rightHeight = isBalanced(root.right, &result)
        if abs(leftHeight - rightHeight) > 1 {
            result = false
        }
        
        return 1 + max(leftHeight, rightHeight)
    }
}



class Solution110x4 {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return root?.depth() != Int.max
    }
    
}

extension TreeNode {
    func depth(withPreviousDepth depth : Int = 1) -> Int {
        let leftDepth = self.left?.depth(withPreviousDepth: depth + 1) ?? depth
        let rightDepth = self.right?.depth(withPreviousDepth: depth + 1) ?? depth
        
        // looks repetitive, but it has better real-world
        // runtime performance than using max() and abs()
        if (leftDepth > rightDepth) {
            guard leftDepth - rightDepth <= 1 else { return Int.max }
            return leftDepth
        } else {
            guard rightDepth - leftDepth <= 1 else { return Int.max }
            return rightDepth
        }
    }
}
