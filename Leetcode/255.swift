/***
 255. Verify Preorder Sequence in Binary Search Tree
 Medium
 
 Problem:
 Given an array of numbers, verify whether it is the correct preorder traversal sequence of a binary search tree.
 
 You may assume each number in the sequence is unique.
 
 Follow up:
 Could you do it using only constant space complexity?
 ***/


class Solution255 {
    func verifyPreorder(_ preorder:[Int]) -> Bool{
        var preorder = preorder
        var low:Int = Int.min
        var i:Int = -1
        for a in preorder
        {
            if a < low
            {
                return false
            }
            while(i >= 0 && a > preorder[i])
            {
                low = preorder[i]
                i -= 1
            }
            i += 1
            preorder[i] = a
        }
        return true
    }
}
