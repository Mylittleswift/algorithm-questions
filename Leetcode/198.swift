/***
 198. House Robber
 Easy

 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
 
 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.
 
 Example 1:
 
 Input: [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.
 Example 2:
 
 Input: [2,7,9,3,1]
 Output: 12
 Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
 Total amount you can rob = 2 + 9 + 1 = 12.
 ***/



class Solution198x1 {
    func rob(_ nums: [Int]) -> Int {
        
        if nums.count <= 0 {
            return 0
        }
        
        var last: Int = 0
        var now: Int = 0
        
        for i in 0...nums.count - 1 {
            let temp = last
            last = now
            now = max(temp + nums[i],now)
        }
        return now
    }
}


class Solution198x2 {
    func rob(_ nums: [Int]) -> Int {
        var dp = [Int]()
        for _ in 0...nums.count {
            dp.append(0)
        }
        for i in 0..<dp.count {
            if i == 0 {
                dp[0] = 0
                continue
            }
            if i == 1 {
                dp[1] = nums[0]
                continue
            }
            dp[i] = max(dp[i - 2] + nums[i - 1], dp[i - 1])
        }
        return dp[nums.count]
    }
}


class Solution198x3 {
    func rob(_ nums: [Int]) -> Int {
        
        let n = nums.count
        if n == 0 { return 0 }
        if n == 1 { return nums[0] }
        var dp = [nums[0], max(nums[0], nums[1])]
        for i in 2..<n {
            dp.append(max(dp[i-1], dp[i-2]+nums[i]))
        }
        return dp.last!
    }
}


class Solution198x4 {
    func rob(_ nums: [Int]) -> Int {
        var currentMax = 0
        var previousMax = 0
        var result = 0
        
        for num in nums {
            result = max(currentMax, previousMax + num)
            previousMax = currentMax
            currentMax = result
        }
        return result
    }
}
