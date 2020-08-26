/***
 162. Find Peak Element
 Medium

 A peak element is an element that is greater than its neighbors.
 
 Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.
 
 The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.
 
 You may imagine that nums[-1] = nums[n] = -∞.
 
 Example 1:
 
 Input: nums = [1,2,3,1]
 Output: 2
 Explanation: 3 is a peak element and your function should return the index number 2.
 Example 2:
 
 Input: nums = [1,2,1,3,5,6,4]
 Output: 1 or 5
 Explanation: Your function can return either index number 1 where the peak element is 2,
 or index number 5 where the peak element is 6.
 Follow up: Your solution should be in logarithmic complexity.
 ***/


class Solution162x1 {
    func findPeakElement(_ nums: [Int]) -> Int {
        var low = 0
        var high = nums.count - 1
        
        while low != high {
            let mid = (low + high)/2
            
            if !nums.indices.contains(mid - 1) {
                if nums[mid + 1] < nums[mid] { return mid }
                low = mid + 1
                continue
            }
            
            if nums[mid - 1] < nums[mid] && nums[mid + 1] < nums[mid] {
                return mid
            }
            
            if nums[mid - 1] < nums[mid] && nums[mid + 1] > nums[mid] {
                low = mid + 1
                continue
            }
            
            high = mid - 1
        }
        
        return high
    }
}


class Solution162x2 {
    func findPeakElement(_ nums: [Int]) -> Int {
        guard nums.count > 1 else{
            return 0
        }
        var left = 0
        var right = nums.count  - 1
        while left < right{
            let middle = (left + right) / 2
            if nums[middle] > nums[middle + 1] {
                right = middle
            }else{
                left = middle + 1
            }
        }
        
        return left
        
    }
}


class Solution162x3 {
    func findPeakElement(_ nums: [Int]) -> Int {
        if nums.count >= 3 {
            for i in Array(1..<nums.count - 1) {
                let left = nums[i - 1]
                let value = nums[i]
                let right = nums[i + 1]
                
                if value > left && value > right {
                    return i
                }
            }
        }
        
        let lower = 0
        let upper = nums.count - 1
        
        return nums[lower] >= nums[upper] ? lower : upper
    }
}


class Solution162x4 {
    func findPeakElement(_ nums: [Int]) -> Int {
        var low = 0
        var high = nums.count - 1
        
        while low != high {
            let mid = (low + high)/2
            
            if !nums.indices.contains(mid - 1) || nums[mid - 1] < nums[mid] {
                if nums[mid + 1] < nums[mid] { return mid }
                low = mid + 1
                continue
            }
            
            high = mid - 1
        }
        
        return high
    }
}


class Solution162x5 {
    func findPeakElement(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        var mid = 0
        
        while left < right {
            mid = (right - left) / 2 + left
            
            if nums[mid] > nums[mid + 1] {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
