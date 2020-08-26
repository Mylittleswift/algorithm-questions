/***
 53. Maximum Subarray
 Easy

 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 
 Example:
 
 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Follow up:
 
 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 ***/


class Solution53x1 {
    func maxSubArray(_ nums: [Int]) -> Int {
        //动态规划法
        var sum:Int = nums[0]
        var n = nums[0]
        for i in 1..<nums.count
        {
            if n>0
            {
                n+=nums[i]
            }
            else
            {
                n = nums[i]
            }
            if sum<n
            {
                sum = n
            }
        }
        return sum
    }
}



class Solution53x2 {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var result = Int(-Int32.max - 1)
        var sum = 0
        for num in nums {
            sum += num
            result = max(result, sum)
            if sum < 0 {
                sum = 0
            }
        }
        
        return result
    }
}


class Solution53x3 {
    func maxSubArray(_ nums: [Int]) -> Int {
        //扫描法
        var current:Int = nums[0]
        var sum = nums[0]
        //考虑如果全是负数，那么返回最大的负数，
        //如果最后的和为正，那么就使用扫描法
        for i in 1..<nums.count
        {
            //当前数小于0则舍去，
            //否则将会影响接下来的和
            //继续下一个数
            if current<0
            {
                current = nums[i]
            }
            else
            {
                //如果当前数不小于0，那么他会对接下来的和有积极影响
                current+=nums[i]
            }
            //这里既实现了负数返回最大也实现了扫描法
            if current>sum
            {
                sum = current
            }
            //这里其实已经隐式的列举了所有可能，保留了所有可能的最大值
        }
        return sum
    }
}
