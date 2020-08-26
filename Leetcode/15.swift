/***
15. 3Sum
Medium

Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note:

The solution set must not contain duplicate triplets.

Example:

Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
[-1, 0, 1],
[-1, -1, 2]
]
 ***/


class Solution15X1 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        var solutions = [[Int]]()
        let sorted = nums.sorted() { $0 < $1 }
        let count = sorted.count
        var i = 0
        
        while (i < count - 2) {
            if (i == 0 || (i > 0 && sorted[i] != sorted[i - 1])) {
                var left = i + 1
                var right = count - 1
                let num = sorted[i]
                
                while (left < right) {
                    let currentSum = sorted[left] + sorted[right] + num
                    if (currentSum == 0) {
                        solutions.append([sorted[left], sorted[right], num])
                        while (left < right && sorted[left] == sorted[left + 1]) {
                            left += 1
                        }
                        while (left < right && sorted[right] == sorted[right - 1]) {
                            right -= 1
                        }
                        left += 1
                        right -= 1
                    } else if (currentSum < 0) {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
            i += 1
        }
        return solutions
    }
}


class Solution15X2 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else {
            return []
        }
        var results = [[Int]]()
        let sortedNums = nums.sorted()
        
        for i in 0..<sortedNums.count-1 {
            if i > 0 && sortedNums[i] == sortedNums[i-1] {
                continue
            }
            let target = 0 - sortedNums[i]
            var low = i + 1
            var high = nums.count - 1
            
            while low < high {
                let sum = sortedNums[low] + sortedNums[high]
                if sum == target {
                    let result = [sortedNums[i], sortedNums[low], sortedNums[high]]
                    results.append(result)
                    
                    while (low < high && sortedNums[low] == sortedNums[low+1]) {
                        low += 1
                    }
                    while (low < high && sortedNums[high] == sortedNums[high-1]) {
                        high -= 1
                    }
                    low += 1
                    high -= 1
                } else if sum < target {
                    low += 1
                } else {
                    high -= 1
                }
            }
        }
        return results
    }
}


class Solution15X3 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        var result = [[Int]]()
        var snums = nums.sorted()
        for i in 0...snums.count-2 {
            if i > 0 && snums[i] == snums[i-1] {
                continue
            }
            var l = i + 1
            var r = snums.count - 1
            while l < r {
                let s = snums[i] + snums[l] + snums[r]
                if s == 0 {
                    result.append([snums[i], snums[l], snums[r]])
                    l += 1
                    r -= 1
                    while l < r && snums[l] == snums[l-1] {
                        l += 1
                    }
                    while l < r && snums[r] == snums[r+1] {
                        r -= 1
                    }
                } else if s < 0 {
                    l += 1
                } else {
                    r -= 1
                }
            }
        }
        return result
    }
}

// LC passed
class Solution15X4 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var result = [[Int]]()
        for i in 0..<nums.count {
            if i == 0 || i > 0 && nums[i] != nums[i - 1] {
                var left = i + 1
                var right = nums.count - 1
                while left < right {
                    if nums[left] + nums[right] + nums[i] == 0 {
                        result.append([nums[left], nums[right], nums[i]])
                        while left < right && nums[left] == nums[left + 1] {
                            left += 1
                        }
                        while left < right && nums[right] == nums[right - 1] {
                            right -= 1
                        }
                        left += 1
                        right -= 1
                    } else if nums[left] + nums[right] + nums[i] < 0 {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
        }
        return result
    }
}
