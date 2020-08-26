/***
 298. Binary Tree Longest Consecutive Sequence
 Problem:
 Given a binary tree, find the length of the longest consecutive sequence path.
 The path refers to any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The longest consecutive path need to be from parent to child (cannot be the reverse).
 For example,
 1
 \
 3
 / \
 2   4
 \
 5
 Longest consecutive sequence path is 3-4-5, so return 3.
 2
 \
 3
 /
 2
 /
 1
 Longest consecutive sequence path is 2-3,not3-2-1, so return 2.
 ***/




class Solution298 {
    func longestConsecutive(_ root: TreeNode?) -> Int {
        var num:Int = 0
        return helper(root,nil,num)
    }
    
    func helper(_ root: TreeNode?,_ p: TreeNode?,_ res:Int) -> Int
    {
        var res = res
        if root == nil {return res}
        res = (p != nil && root!.val == p!.val + 1) ? res + 1 : 1
        return max(res, max(helper(root?.left, root, res), helper(root?.right, root, res)))
    }
}
