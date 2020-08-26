/***
 169. Majority Element
 Easy

 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 
 You may assume that the array is non-empty and the majority element always exist in the array.
 
 Example 1:
 
 Input: [3,2,3]
 Output: 3
 Example 2:
 
 Input: [2,2,1,1,1,2,2]
 Output: 2
 ***/



class Solution169x1 {
    func majorityElement(_ nums: [Int]) -> Int {
        var res:Int = 0
        var counts:Int = 0
        for n in nums
        {
            if counts == 0
            {
                res = n
                counts = 1
            }
            else if res == n
            {
                counts += 1
            }
            else
            {
                counts -= 1
            }
        }
        return res
    }
}


class Solution169x2 {
    func majorityElement(_ nums: [Int]) -> Int {
        var count = 1
        var pre = nums[0]
        var result = pre
        for i in 1..<nums.count {
            if count == 0 {
                count = 1
                pre = nums[i]
                result = nums[i]
            } else if pre == nums[i] {
                count += 1
            } else {
                count -= 1
            }
            
        }
        
        return result
        
    }
}
