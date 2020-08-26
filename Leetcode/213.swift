/***
 213. House Robber II
 Medium

 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
 
 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.
 
 Example 1:
 
 Input: [2,3,2]
 Output: 3
 Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2),
 because they are adjacent houses.
 Example 2:
 
 Input: [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.
 ***/



class Solution213x1 {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count != 1 else {
            return nums[0]
        }
        
        return max(helper(nums, 0, nums.count - 2), helper(nums, 1, nums.count - 1))
    }
    
    fileprivate func helper(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        if start > end {
            return 0
        }
        
        var prev = 0, current = 0
        
        for i in start...end {
            (current, prev) = (max(prev + nums[i], current), current)
        }
        
        return current
    }
}


class Solution213x2 {
    
    func rob(_ nums: [Int]) -> Int {
        
        if nums.count == 0 { return 0 }
        if nums.count == 1 { return nums[0] }
        
        return max(rob_nonCircular(nums, start: 0, end: nums.count - 1), rob_nonCircular(nums, start: 1, end: nums.count))
    }
    
    func rob_nonCircular(_ nums: [Int], start: Int, end: Int) -> Int {
        var a = nums[start], na = 0 // adjacent, non-adjacent
        
        for i in (start+1)..<end {
            let tmp = a
            a = na + nums[i]
            na = max(na, tmp)
        }
        
        return max(a, na)
    }
}


class Solution213x3 {
    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }else if nums.count <= 3 {
            return nums.max()!
        }
        
        return max(rob(nums, 0, nums.count-1), rob(nums, 1, nums.count))
    }
    
    func rob(_ nums : [Int], _ start : Int, _ end : Int) -> Int {
        var currMax = nums[start]
        var nextMax = max(currMax, nums[start+1])
        
        for i in start+2..<end {
            let tmp = nextMax
            nextMax = max(currMax + nums[i], tmp)
            currMax = tmp
        }
        return nextMax
    }
}
