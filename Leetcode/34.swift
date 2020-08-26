/***
 34. Find First and Last Position of Element in Sorted Array
 Medium

 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
 
 Your algorithm's runtime complexity must be in the order of O(log n).
 
 If the target is not found in the array, return [-1, -1].
 
 Example 1:
 
 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 Example 2:
 
 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 ***/



class Solution34x2 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let start = binarySearch(nums, target)
        if start == nums.count || nums[start] != target {
            return [-1, -1]
        }
        let end = binarySearch(nums, target + 1) - 1
        return [start, end]
    }
    
    private func binarySearch(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count
        while left < right {
            let middle = left + (right - left) / 2
            if nums[middle] < target {
                left = middle + 1
            } else {
                right = middle
            }
        }
        return left
    }
}


class Solution34x3 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = nums.count - 1
        var mid = 0
        var first = -1
        
        // 寻找第一个出现target的位置
        while left <= right {
            mid = left + (right - left)/2
            if nums[mid] >= target {
                right = mid - 1
            } else {
                left = mid + 1
            }
            if nums[mid] == target {
                first = mid
            }
        }
        
        // 如果找不到第一个直接返回
        if first == -1 {
            return [-1, -1]
        }
        
        // 寻找最后一个出现target的位置
        var last = -1
        left = first
        right = nums.count - 1
        while left <= right {
            mid = left + (right - left)/2
            if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
            if nums[mid] == target {
                last = mid
            }
        }
        return [first,last]
    }
}


class Solution34x4 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var startIndex: Int?
        var endIndex: Int?
        
        for (index, num) in nums.enumerated() {
            if num == target {
                if startIndex == nil {
                    startIndex = index
                }
                endIndex = index
            }
        }
        if startIndex == nil {
            return [-1, -1]
        } else {
            return [startIndex!, endIndex!]
        }
    }
}

