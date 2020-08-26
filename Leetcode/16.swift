/***
 16. 3Sum Closest
 Medium

 Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
 
 Example:
 
 Given array nums = [-1, 2, 1, -4], and target = 1.
 
 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 ***/


// LC passed
class Solution16x1 {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 {
            return 0
        }
        var result = Int.max
        var sortedNums = nums.sorted(by: <)
        for i in 0..<nums.count - 2 {
            if i == 0 || sortedNums[i] != sortedNums[i - 1] {
                var left = i + 1
                var right = nums.count - 1
                while left < right {
                    let temp = sortedNums[i] + sortedNums[left] + sortedNums[right]
                    if result == Int.max || abs(temp - target) < abs(result - target) {
                        result = temp
                    }
                    if temp > target {
                        right -= 1
                    } else if temp < target {
                        left += 1
                    } else {
                        return temp
                    }
                }
            }
        }
        return result
    }
}



//LC PASSED
class Solution16x2 {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 2 else { return 0 }
        var finalSum = nums[0] + nums[1] + nums[2]
        var nums = nums.sorted()
        for i in 0..<nums.count - 2 {
            var j = i + 1, k = nums.count - 1
            while j < k {
                let currSum = nums[i] + nums[j] + nums[k]
                if currSum == target {
                    return currSum
                } else {
                    if abs(target - currSum) < abs(target - finalSum) {
                        finalSum = currSum
                    }
                    if currSum < target {
                        j += 1
                    } else {
                        k -= 1
                    }
                }
            }
        }
        return finalSum
    }
}


