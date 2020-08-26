/***
 81. Search in Rotated Sorted Array II
 Medium

 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., [0,0,1,2,2,5,6] might become [2,5,6,0,0,1,2]).
 
 You are given a target value to search. If found in the array return true, otherwise return false.
 
 Example 1:
 
 Input: nums = [2,5,6,0,0,1,2], target = 0
 Output: true
 Example 2:
 
 Input: nums = [2,5,6,0,0,1,2], target = 3
 Output: false
 Follow up:
 
 This is a follow up problem to Search in Rotated Sorted Array, where nums may contain duplicates.
 Would this affect the run-time complexity? How and why?
 ***/



class Solution81x1 {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        if nums.count == 0 {
            return false
        }
        
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let middle = left + (right - left) / 2
            if nums[middle] == target {
                return true
            }
            if nums[middle] > nums[right] {
                if nums[middle] > target && nums[left] <= target {
                    right = middle
                } else {
                    left = middle + 1
                }
            } else if nums[middle] < nums[right] {
                if nums[middle] < target && nums[right] >= target {
                    left = middle + 1
                } else {
                    right = middle
                }
            } else {
                right -= 1
            }
        }
        
        return nums[left] == target
    }
}


class Solution81x2 {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        
        if nums.count <= 0 { return false }
        
        var lo = 0
        var hi = nums.count - 1
        var mid = (lo + hi) / 2
        
        while lo <= hi {
            mid = (lo + hi) / 2
            
            //print("Check Piv [\(lo) \(mid) \(hi)] => {\(nums[lo]) \(nums[mid]) \(nums[hi])}")
            
            if nums[mid] == target {
                return true
            }
            
            if nums[mid] > nums[lo] {
                
                if target >= nums[lo] && target < nums[mid] {
                    hi = mid - 1
                } else {
                    lo = mid + 1
                }
            } else if nums[mid] < nums[lo] {
                if target > nums[mid] && target <= nums[hi] {
                    lo = mid + 1
                } else {
                    hi = mid - 1
                }
            } else {
                lo += 1
            }
        }
        return false
    }
}


class Solution81x3 {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        
        var left = 0, right = nums.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return true
            }
            if nums[mid] == nums[left] {
                left += 1
            } else if nums[mid] > nums[left] {
                if target >= nums[left] && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if target > nums[mid] && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        
        return false
    }
}


class Solution81x4 {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var set: Set = Set<Int>.init()
        for d in nums {
            if d == target {
                return true
            }else {
                if set.contains(target) {
                    return true
                }else {
                    set.insert(d)
                }
            }
        }
        return false
    }
}


class Solution81x5 {
    
    func search(_ nums: [Int], _ target: Int) -> Bool {
        return nums.contains(target)
    }
}


