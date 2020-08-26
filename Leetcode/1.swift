/***
1. Two Sum
Easy

Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
***/

class Solution1x1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var table: [Int:Int] = [Int:Int]()
        for (firstIndex, num) in nums.enumerated() {
            let res: Int = target - num
            //可选链接
            if let secondIndex = table[res]
            {
                return [secondIndex,firstIndex]
            }
            else
            {
                table[num] = firstIndex
            }
        }
        return [-1,-1]
    }
}

class Solution1x2 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var out: [Int] = []
        
        var dict:[Int: Int] = [:]
        for (index,num) in nums.enumerated() {
            if let sum = dict[target - num] {
                out.append(index)
                out.append(sum)
            }
            dict[num] = index
        }
        return out
    }
}

class Solution1x3 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0...nums.count-1 {
            if i == nums.count-1 { break; }
            for j in i+1...nums.count-1 {
                let sum = nums[i] + nums[j]
                if sum == target {
                    return [i, j]
                }
            }
        }
        return [Int]()
    }
}

