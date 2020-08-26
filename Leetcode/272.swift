/***
 272 Closest Binary Search Tree Value II
 Hard
 
 Problem
 Given a non-empty binary search tree and a target value, find k values in the BST that are closest to the target.
 Note: Given target value is a floating point. You may assume k is always valid, that is: k ≤ total nodes. You are guaranteed to have only one unique set of k values in the BST that are closest to the target. Follow up: Assume that the BST is balanced, could you solve it in less than O(n) runtime (where n = total nodes)?
 ***/




class Solution272 {
    func closestKValues(_ root: TreeNode?,_ target:Double,_ k:Int) -> [Int] {
        var res:[Int] = [Int]()
        inorder(root, target, k, &res)
        return res
    }
    
    func inorder(_ root: TreeNode?,_ target:Double,_ k:Int,_ res:inout [Int])
    {
        if root == nil {return}
        inorder(root?.left, target, k, &res)
        if res.count < k
        {
            res.append(root!.val)
        }
        else if abs(Double(root!.val) - target) < abs(Double(res[0]) - target)
        {
            res.removeFirst()
            res.append(root!.val)
        }
        else
        {
            return
        }
        inorder(root?.right, target, k, &res)
    }
}
