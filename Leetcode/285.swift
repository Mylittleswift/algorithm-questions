/***
 285 Inorder Successor in BST
 Medium
 
 Problem:
 Given a binary search tree and a node in it, find the in-order successor of that node in the BST.
 Note: If the given node has no in-order successor in the tree, return null.
 ***/



class Solution285 {
    func inorderSuccessor(_ root: TreeNode?,_ p: TreeNode?) -> TreeNode? {
        var root = root
        var res:TreeNode? = nil
        while(root != nil)
        {
            if root!.val > p!.val
            {
                res = root
                root = root?.left
            }
            else
            {
                root = root?.right
            }
        }
        return res
    }
}
