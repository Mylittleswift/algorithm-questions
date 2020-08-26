/***
 136. Single Number
 Easy
 
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.
 
 Note:
 
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Example 1:
 
 Input: [2,2,1]
 Output: 1
 Example 2:
 
 Input: [4,1,2,1,2]
 Output: 4
 ***/



class Solution136x1 {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = nums.first!
        
        for index in 1..<nums.count {
            result = result ^ nums[index]
        }
        
        return result;
    }
}


class Solution136x2 {
    func singleNumber(_ nums: [Int]) -> Int {
        // 2 * (a + b) - (a + b + a) = b
        let set = Set(nums)
        let setSum = set.reduce(0, +)
        let arrSum = nums.reduce(0, +)
        
        return 2 * setSum - arrSum
    }
}


class Solution136x3 {
    func singleNumber(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        
        for item in nums
        {
            if set.contains(item) {
                set.remove(item)
            }
            else
            {
                set.insert(item)
            }
        }
        
        return set.popFirst()!
    }
}


class Solution136x4 {
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0, { $0^$1 })
    }
}


class Solution136x5 {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        
        for num in nums {
            dict[num] = (dict[num] ?? 0) + 1
        }
        
        for num in dict.keys {
            if dict[num] == 1 {
                return num
            }
        }
        
        return 0
    }
}
