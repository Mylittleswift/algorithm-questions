/***
 154. Find Minimum in Rotated Sorted Array II
 Hard

 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).
 
 Find the minimum element.
 
 The array may contain duplicates.
 
 Example 1:
 
 Input: [1,3,5]
 Output: 1
 Example 2:
 
 Input: [2,2,2,0,1]
 Output: 0
 Note:
 
 This is a follow up problem to Find Minimum in Rotated Sorted Array.
 Would allow duplicates affect the run-time complexity? How and why?
 ***/



class Solution154x1 {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        while left < right {
            if nums[left] < nums[right] { return nums[left] }
            let mid = (left + right) / 2
            if nums[mid] < nums[left] {
                right = mid
            } else if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right -= 1
            }
        }
        return nums[left]
    }
}


class Solution154x2 {
    func findMin(_ nums: [Int]) -> Int {
        let arraySize = nums.count
        
        if arraySize == 1 { return nums[0] }
        if arraySize == 2 { return min(nums[0], nums[1]) }
        let midElement = arraySize / 2
        if nums[midElement] > nums[arraySize-1] {
            return findMin(Array(nums[midElement...arraySize-1]))
        } else if nums[midElement] < nums[0] {
            return findMin(Array(nums[0...midElement]))
        } else {
            return min(findMin(Array(nums[midElement...arraySize-1])), findMin(Array(nums[0...midElement])))
        }
    }
}


class Solution154x3 {
    func findMin(_ nums: [Int]) -> Int {
        
        if nums.isEmpty {
            return -1
        }
        
        if nums.count == 1 {
            return nums[0]
        }
        
        var beigin = nums[0]
        var i = 1
        while i < nums.count {
            if nums[i] >= beigin {
                beigin = nums[i]
                i += 1
            } else {
                return nums[i]
            }
        }
        
        return nums[0]
    }
}


class Solution154x4 {
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return -1 }
        return nums.min()!
    }
}
