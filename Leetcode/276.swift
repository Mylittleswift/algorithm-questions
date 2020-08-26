/***
 276. Paint Fence
 Easy
 
 Problem:
 There is a fence with n posts, each post can be painted with one of the k colors.
 You have to paint all the posts such that no more than two adjacent fence posts have the same color.
 Return the total number of ways you can paint the fence.
 Note: n and k are non-negative integers.
 ***/


class Solution276 {
    func numWays(_ n:Int,_ k:Int) -> Int {
        if n == 0 {return 0}
        var same:Int = 0
        var diff:Int = k
        for i in 2...n
        {
            var t:Int = diff
            diff = (same + diff) * (k - 1)
            same = t
        }
        return same + diff
    }
}
