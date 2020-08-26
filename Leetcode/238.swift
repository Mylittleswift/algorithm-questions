/***
 238. Product of Array Except Self
 Medium

 Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
 
 Example:
 
 Input:  [1,2,3,4]
 Output: [24,12,8,6]
 Constraint: It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.
 
 Note: Please solve it without division and in O(n).
 
 Follow up:
 Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
 ***/



class Solution238x1 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        
        var result : [Int] = []
        var mutiplier = 1
        
        for num in nums
        {
            result.append(mutiplier)
            mutiplier *= num
        }
        
        mutiplier = 1
        var index = nums.count - 1
        while index>=0
        {
            result[index] *= mutiplier
            mutiplier *= nums[index]
            index -= 1
        }
        
        return result
    }
}


class Solution238x2 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [] }
        
        var output = [Int](repeating: 1, count: nums.count)
        for i in nums.indices.dropFirst() {
            output[i] = output[i - 1] * nums[i - 1]
        }
        
        var right = nums[nums.count - 1]
        for i in nums.indices.dropLast().reversed() {
            output[i] *= right
            right *= nums[i]
        }
        
        return output
    }
}


class Solution238x3 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let total = nums.filter({ $0 != 0 }).reduce(1, { $0 * $1 })
        let zero_count = nums.filter({ $0 == 0}).count
        return nums.map { number -> Int in
            if zero_count == 0 {
                return total / number
            } else if zero_count == 1 {
                return number == 0 ? total : 0
            } else {
                return 0
            }
        }
    }
}
