/***
 268. Missing Number
 Easy

 Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
 
 Example 1:
 
 Input: [3,0,1]
 Output: 2
 Example 2:
 
 Input: [9,6,4,2,3,5,7,0,1]
 Output: 8
 Note:
 Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
 ***/



class Solution268x1 {
    func missingNumber(_ nums: [Int]) -> Int {
        //利用异或运算，将数组全体内容与0~n进行异或,
        //根据异或运算的性质可知最后结果为缺少的那个数字。
        var result:Int = nums.count
        for i in 0..<nums.count
        {
            result ^= i ^ nums[i]
        }
        return result
    }
}


class Solution268x2 {
    func missingNumber(_ nums: [Int]) -> Int {
        var h = (nums.count+1)*nums.count/2
        for i in 0..<nums.count {
            h -= nums[i]
        }
        return h
    }
}


class Solution268x3 {
    func missingNumber(_ nums: [Int]) -> Int {
        var sum = 0
        var max = 0
        var i = 0
        while i < nums.count {
            max = max + i
            sum = sum + nums[i]
            i = i + 1
        }
        return max - sum + i
    }
}
