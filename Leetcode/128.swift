/***
 128. Longest Consecutive Sequence
 Hard

 Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
 
 Your algorithm should run in O(n) complexity.
 
 Example:
 
 Input: [100, 4, 200, 1, 3, 2]
 Output: 4
 Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
 ***/


class Solution128x1 {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var nums = nums.sorted(){$0 < $1}
        
        var longestStreak = 1
        var currentStreak = 1
        for i in 1..<nums.count {
            if nums[i] != nums[i - 1] {
                if nums[i - 1] + 1 == nums[i] {
                    currentStreak += 1
                }else {
                    longestStreak = max(longestStreak, currentStreak)
                    currentStreak = 1
                }
            }
        }
        return max(longestStreak, currentStreak)
    }
}


class Solution128x2 {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let set = Set(nums)
        
        var longestStreak = 0
        
        for s in set {
            if !set.contains(s - 1) {
                var currentNumber = s
                var currentStreak = 1
                
                while set.contains(currentNumber + 1) {
                    currentNumber += 1
                    currentStreak += 1
                }
                
                longestStreak = max(longestStreak, currentStreak)
            }
        }
        
        return longestStreak
    }
}


class Solution128x3 {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var numSet = Set(nums)
        var longest = 0
        for num in nums {
            if numSet.contains(num) {
                var left = num - 1
                var right = num + 1
                numSet.remove(num)
                while numSet.contains(left) {
                    numSet.remove(left)
                    left -= 1
                }
                while numSet.contains(right) {
                    numSet.remove(right)
                    right += 1
                }
                longest = max(longest, right - left - 1)
            }
        }
        return longest
    }
}


class Solution128x4 {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set = Set(nums), longest = 0
        
        for num in nums {
            if set.contains(num) {
                set.remove(num)
                let distance = 1 + findConsecutive(&set, num, 1) + findConsecutive(&set, num, -1)
                longest = max(longest, distance)
            }
        }
        
        return longest
    }
    
    fileprivate func findConsecutive(_ set: inout Set<Int>, _ num: Int, _ step: Int) -> Int {
        var len = 0, num = num + step
        
        while set.contains(num) {
            set.remove(num)
            len += 1
            num += step
        }
        
        return len
    }
}


class Solution128x5 {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        
        let sorted = nums.sorted()
        var last = 0
        var maxLength = 1
        var duplicated = 0
        
        for idx in 1 ..< sorted.count {
            if sorted[idx] == sorted[idx - 1] {
                duplicated += 1
            } else if sorted[idx] == sorted[idx - 1] + 1 {
                let length = idx - duplicated - last + 1
                maxLength = max(maxLength, length)
            } else {
                duplicated = 0
                last = idx
            }
        }
        
        return maxLength
    }
}
