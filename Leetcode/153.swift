/***
 153. Find Minimum in Rotated Sorted Array
 Medium

 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).
 
 Find the minimum element.
 
 You may assume no duplicate exists in the array.
 
 Example 1:
 
 Input: [3,4,5,1,2]
 Output: 1
 Example 2:
 
 Input: [4,5,6,7,0,1,2]
 Output: 0
 ***/



class Solution153x1 {
    func findMin(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let middle = left + (right - left) / 2
            if nums[middle] > nums[right] {
                left = middle + 1
            } else {
                right = middle
            }
        }
        
        return nums[left]
    }
}


class Solution153x2 {
    func findMin(_ nums: [Int]) -> Int {
        
        if nums.count == 1{
            return nums[0]
        }
        
        if nums[0] > nums[nums.count-1]{
            for i in 0..<(nums.count-1){
                if nums[i] > nums[i+1] {
                    return nums[i+1]
                }
            }
        }else{
            return nums[0]
        }
        
        return -1
    }
}


class Solution153x3 {
    func findMin(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count - 1
        var gap = (end - start) / 2
        while (end - start) > 1 {
            if nums[gap] > nums[end] {
                start = gap
                gap = start + ((end - gap) / 2)
            }else if nums[gap] < nums[end]{
                end = gap
                gap = (end - start) / 2
            }
        }
        return nums[end] > nums[start] ? nums[start] : nums[end]
    }
}
