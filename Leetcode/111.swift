/***
 111. Minimum Depth of Binary Tree
 Easy

 Given a binary tree, find its minimum depth.
 
 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Given binary tree [3,9,20,null,null,15,7],
 
 3
 / \
 9  20
 /  \
 15   7
 return its minimum depth = 2.
 ***/




class Solution111x1 {
    func minDepth(_ root: TreeNode?) -> Int {
        //深度优先搜索DFS
        if root == nil {return 0}
        if root!.left == nil && root!.right == nil
        {
            return 1
        }
        if root!.left == nil
        {
            return minDepth(root!.right) + 1
        }
        else if root!.right == nil
        {
            return minDepth(root!.left) + 1
        }
        else
        {
            let depthLeft:Int = minDepth(root!.left)
            let depthRight:Int = minDepth(root!.right)
            return (1 + ((depthLeft < depthRight) ? depthLeft : depthRight))
        }
    }
}



class Solution111x2 {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = minDepth(root.left)
        let right = minDepth(root.right)
        return 1 + ((left == 0 || right == 0) ? max(left, right) : min(left, right))
    }
}
