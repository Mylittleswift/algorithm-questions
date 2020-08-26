/***
 45. Jump Game II
 Hard

 Given an array of non-negative integers, you are initially positioned at the first index of the array.
 
 Each element in the array represents your maximum jump length at that position.
 
 Your goal is to reach the last index in the minimum number of jumps.
 
 Example:
 
 Input: [2,3,1,1,4]
 Output: 2
 Explanation: The minimum number of jumps to reach the last index is 2.
 Jump 1 step from index 0 to 1, then 3 steps to the last index.
 ***/



class Solution45x2 {
    func jump(_ nums: [Int]) -> Int {
        var endIndex = 0
        var jump = 0
        var mostFurther = 0
        for i in 0..<nums.count - 1 {
            mostFurther = max(mostFurther, i + nums[i])
            if i == endIndex {
                jump += 1
                endIndex = mostFurther
            }
        }
        return jump
    }
}


class Solution45x3 {
    func jump(_ nums: [Int]) -> Int {
        var cnt = 0, idx = 0
        var cur = 0, pre = 0
        while cur < nums.count - 1 {
            cnt += 1
            pre = cur
            while idx <= pre {
                cur = max(cur, idx + nums[idx])
                idx += 1
            }
        }
        return cnt
    }
}


