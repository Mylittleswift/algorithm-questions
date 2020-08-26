/***
 18. 4Sum
 Medium

 Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
 
 Note:
 
 The solution set must not contain duplicate quadruplets.
 
 Example:
 
 Given array nums = [1, 0, -1, 0, -2, 2], and target = 0.
 
 A solution set is:
 [
 [-1,  0, 0, 1],
 [-2, -1, 1, 2],
 [-2,  0, 0, 2]
 ]
 ***/


//LC PASSED
class Solution18x2 {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 {return []}
        let sorted = nums.sorted()
        var results = [[Int]]()
        for i in 0..<(nums.count - 3) {
            if i > 0 && sorted[i] == sorted[i - 1] {continue}
            for j in (i + 1)..<(nums.count - 2) {
                if j > i + 1 && sorted[j] == sorted[j - 1] {continue}
                var k = j + 1
                var l = nums.count - 1
                let twoSumTarget = target - sorted[i] - sorted[j]
                while k < l {
                    let twoSum = sorted[k] + sorted[l]
                    if twoSum < twoSumTarget {k += 1}
                    if twoSum > twoSumTarget {l -= 1}
                    if twoSum == twoSumTarget {
                        results.append([sorted[i], sorted[j], sorted[k], sorted[l]])
                        repeat {k += 1} while k < l && sorted[k] == sorted[k - 1]
                        repeat {l -= 1} while k < l && sorted[l] == sorted[l + 1]
                    }
                }
            }
        }
        return results
    }
}


//LC PASSED
class Solution18x3 {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let count = nums.count
        guard count >= 4 else { return [] }
        let nums = nums.sorted()
        
        var result = [[Int]]()
        for i in 0..<count - 3 {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            let threeSum = target - nums[i]
            
            for j in i + 1..<count - 2 {
                if j > i + 1 && nums[j] == nums[j - 1] {
                    continue
                }
                let twoSum = threeSum - nums[j]
                var left = j + 1, right = count - 1
                while left < right {
                    if nums[left] + nums[right] == twoSum {
                        result.append([nums[i], nums[j], nums[left], nums[right]])
                        while left < right && nums[left] == nums[left + 1] {
                            left += 1
                        }
                        while left < right && nums[right] == nums[right - 1] {
                            right -= 1
                        }
                        left += 1
                        right -= 1
                    } else if nums[left] + nums[right] < twoSum {
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


class Solution18x4 {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var res: [[Int]]  =  [[Int]]()
        let len = nums.count
        if len < 4 {return res}
        var nums = nums.sorted(by: <)
        for i in 0..<len {
            if i > 0 && nums[i] == nums[i - 1] {continue}
            for j in (i + 1)..<len {
                //第二个数的去重处理
                if j > i + 1 && nums[j] == nums[j - 1] {continue}
                var l = j + 1
                var r = len - 1
                while (l < r) {
                    let sum = nums[i] + nums[j] + nums[l] + nums[r]
                    if sum == target {
                        res.append([nums[i], nums[j], nums[l], nums[r]])
                        while (l < r && nums[l] == nums[l + 1]) { l += 1}
                        while (l < r && nums[r] == nums[r - 1]) { r -= 1}
                        l += 1
                        r -= 1
                    } else if sum < target {l += 1}
                    else {r -= 1}
                }
            }
        }
        return res
    }
}


class Solution18x5 {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var array = nums.sorted()
        var result = [[Int]]()
        guard nums.count >= 4 else {
            return result
        }
        for i in 0 ..< nums.count - 3 {
            // solve 3Sum
            for j in i + 1 ..< nums.count - 2 {
                var left = j + 1
                var right = nums.count - 1
                while left < right {
                    let sum = array[i] + array[j] + array[left] + array[right]
                    if sum == target {
                        let temp = [array[i], array[j], array[left], array[right]]
                        if !result.contains(temp) {
                            result.append(temp)
                        }
                        left += 1
                        right -= 1
                    } else if sum > target {
                        right -= 1
                    } else {
                        left += 1
                    }
                }
            }
        }
        return result
    }
}
