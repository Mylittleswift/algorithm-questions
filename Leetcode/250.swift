/***
 250 Count Univalue Subtrees
 Medium
 
 Problem:
 Given a binary tree, count the number of uni-value subtrees.
 A Uni-value subtree means all nodes of the subtree have the same value.
 
 For example: Given binary tree,
 5
 / \
 1   5
 / \   \
 5   5   5
 return 4.
 ***/




class Solution250 {
    func countUnivalSubtrees(_ root:TreeNode?) -> Int {
        var b:Bool = true
        return isUnival(root, &b)
    }
    
    func isUnival(_ root:TreeNode?,_ b:inout Bool) -> Int
    {
        if root == nil { return 0 }
        var l:Bool = true
        var r:Bool = true
        var res:Int = isUnival(root?.left, &l) + isUnival(root?.right, &r)
        b = l && r
        if root?.left != nil
        {
            b = b && (root!.val == root!.left!.val)
        }
        else
        {
            b = b && true
        }
        
        if root?.right != nil
        {
            b = b && (root!.val == root!.right!.val)
        }
        else
        {
            b = b && true
        }
        var num:Int = b ? 1 : 0
        return res + num
    }
}
