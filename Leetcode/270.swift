/***
 270. Closest Binary Search Tree Value
 Easy
 
 Problem:
 Given a non-empty binary search tree and a target value, find the value in the BST that is closest to the target.
 Note: Given target value is a floating point. You are guaranteed to have only one unique value in the BST that is closest to the target.
 ***/



class Solution270 {
    func closestValue(_ root: TreeNode?,_ target:Double) -> Int {
        var a:Int = root!.val
        var t:TreeNode? = target < Double(a) ? root?.left : root?.right
        if t == nil {return a}
        var b:Int = closestValue(t, target)
        return abs(Double(a) - target) < abs(Double(b) - target) ? a : b
    }
}
