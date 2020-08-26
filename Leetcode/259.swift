/***
 259 3Sum Smaller
 Medium
 
 Problem:
 Given an array of n integers nums and a target, find the number of index triplets i, j, k with 0 <= i < j < k < n that satisfy the condition nums[i] + nums[j] + nums[k] < target.
 For example, given nums = [-2, 0, 1, 3], and target = 2.
 Return 2. Because there are two triplets which sums are less than 2:
 [-2, 0, 1]
 [-2, 0, 3]
 Follow up: Could you solve it in O(n2) runtime?
 ***/



class Solution259 {
    func threeSumSmaller(_ nums:[Int],_ target:Int) -> Int{
        var nums = nums
        if nums.count < 3 {return 0}
        var res:Int = 0
        var n:Int = nums.count
        nums = nums.sorted(by:<)
        for i in 0..<(n - 2)
        {
            var left:Int = i + 1
            var right:Int = n - 1
            while (left < right)
            {
                if nums[i] + nums[left] + nums[right] < target
                {
                    res += right - left
                    left += 1
                }
                else
                {
                    right -= 1
                }
            }
        }
        return res
    }
}
